#ifndef AUDIO_FILTER_TEST_MODEL_HPP
#define AUDIO_FILTER_TEST_MODEL_HPP
#include <array>
#include <cmath>
#include <cstdint>
#include <deque>

// Independent, host-only reference using a queue and floating-point mean.
class Reference {
    std::array<std::deque<std::int32_t>, 8> samples;
public:
    std::uint32_t process(std::uint32_t word, unsigned id, bool bypass) {
        if (id >= 8 || ((word >> 28) & 1U)) return word;
        std::uint32_t raw = (word >> 4) & 0xFFFFFFU;
        std::int32_t sample = (raw >= 0x800000U) ?
            static_cast<std::int32_t>(raw) - 0x1000000 : raw;
        auto &q = samples[id];
        q.push_back(sample);
        if (q.size() > 8) q.pop_front();
        double sum = 0;
        for (auto value : q) sum += value;
        std::int32_t y = static_cast<std::int32_t>(std::floor(sum / 8.0));
        if (bypass) return word;
        std::uint32_t out = (word & 0x7000000FU) |
            ((static_cast<std::uint32_t>(y) & 0xFFFFFFU) << 4);
        unsigned ones = 0;
        for (unsigned bit = 4; bit <= 30; ++bit) ones += (out >> bit) & 1U;
        return out | ((ones & 1U) << 31);
    }
};

inline std::uint32_t make_word(std::int32_t x, std::uint32_t metadata) {
    return (metadata & 0xF000000FU) |
           ((static_cast<std::uint32_t>(x) & 0xFFFFFFU) << 4);
}
#endif
