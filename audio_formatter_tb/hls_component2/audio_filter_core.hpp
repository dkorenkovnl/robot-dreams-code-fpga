#ifndef AUDIO_FILTER_CORE_HPP
#define AUDIO_FILTER_CORE_HPP

#include <cstdint>

namespace audio_filter {
static const unsigned CHANNELS = 8;
static const unsigned TAPS = 8;

inline std::int32_t unpack_sample(std::uint32_t word)
{
    const std::uint32_t raw = (word >> 4) & 0xFFFFFFU;
    return (raw & 0x800000U) ? static_cast<std::int32_t>(raw) - 0x1000000
                             : static_cast<std::int32_t>(raw);
}

inline std::uint32_t parity_bit(std::uint32_t word)
{
    // IEC 60958 even parity covers bits 4..31, excluding the preamble.
    std::uint32_t v = (word >> 4) & 0x07FFFFFFU;
    v ^= v >> 16;
    v ^= v >> 8;
    v ^= v >> 4;
    v ^= v >> 2;
    v ^= v >> 1;
    return v & 1U;
}

inline std::uint32_t process(std::uint32_t word, unsigned channel,
                            bool bypass,
                            std::int32_t history[CHANNELS][TAPS - 1])
{
#pragma HLS INLINE
    // AXIS TID is 3 bits; pass through unexpected IDs in native use.
    // V=1 means invalid audio: forward it without updating filter history.
    if (channel >= CHANNELS || (word & 0x10000000U))
        return word;

    const std::int32_t x = unpack_sample(word);
    std::int64_t sum = x;
    for (unsigned k = 0; k < TAPS - 1; ++k) {
#pragma HLS UNROLL
        sum += history[channel][k];
    }
    for (int k = TAPS - 2; k > 0; --k) {
#pragma HLS UNROLL
        history[channel][k] = history[channel][k - 1];
    }
    history[channel][0] = x;

    // Floor division by eight, including negative values. All arithmetic
    // stays within int64_t; the average remains within signed 24-bit range.
    const std::int32_t y = static_cast<std::int32_t>(
        sum >= 0 ? sum / 8 : -((-sum + 7) / 8));

    // Keep history warm while bypassed; output remains exactly unchanged.
    if (bypass)
        return word;

    // Preserve C/U/V and preamble; replace only sample and parity.
    std::uint32_t result = (word & 0x7000000FU) |
        ((static_cast<std::uint32_t>(y) & 0xFFFFFFU) << 4);
    result |= parity_bit(result) << 31;
    return result;
}
} // namespace audio_filter
#endif
