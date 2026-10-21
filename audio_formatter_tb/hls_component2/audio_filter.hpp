#ifndef AUDIO_FILTER_HPP
#define AUDIO_FILTER_HPP

#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

// Only TDATA/TID/TVALID/TREADY, matching AMD's audio AXIS interfaces.
// No TLAST, TKEEP, TSTRB, TUSER, or TDEST.
using audio_axis_t = hls::axis_data<ap_uint<32>, AXIS_ENABLE_ID, 0, 3, 0>;

void audio_filter_hls(hls::stream<audio_axis_t> &s_axis,
                      hls::stream<audio_axis_t> &m_axis,
                      ap_uint<1> bypass);
#endif