#include "audio_filter.hpp"
#include "audio_filter_core.hpp"

void audio_filter_hls(hls::stream<audio_axis_t> &s_axis,
                      hls::stream<audio_axis_t> &m_axis,
                      ap_uint<1> bypass)
{
#pragma HLS INTERFACE axis port=s_axis
#pragma HLS INTERFACE axis port=m_axis
#pragma HLS INTERFACE s_axilite port=bypass bundle=control offset=0x20
#pragma HLS INTERFACE s_axilite port=return bundle=control
#pragma HLS PIPELINE II=1 style=flp

    static std::int32_t history[audio_filter::CHANNELS][audio_filter::TAPS - 1] = {};
#pragma HLS ARRAY_PARTITION variable=history complete dim=0
#pragma HLS RESET variable=history

    // Blocking operations: HLS generates backpressure automatically.
    // One invocation handles one word. Enable auto-restart in software.
    audio_axis_t packet = s_axis.read();
    packet.data = audio_filter::process(packet.data.to_uint(),
                                       packet.id.to_uint(),
                                       bypass != 0, history);
    m_axis.write(packet);
}