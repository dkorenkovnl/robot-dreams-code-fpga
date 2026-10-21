set SynModuleInfo {
  {SRCNAME audio_filter_hls MODELNAME audio_filter_hls RTLNAME audio_filter_hls IS_TOP 1
    SUBMODULES {
      {MODELNAME audio_filter_hls_sparsemux_17_3_24_1_1 RTLNAME audio_filter_hls_sparsemux_17_3_24_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME audio_filter_hls_sparsemux_17_3_25_1_1 RTLNAME audio_filter_hls_sparsemux_17_3_25_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME audio_filter_hls_control_s_axi RTLNAME audio_filter_hls_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME audio_filter_hls_regslice_both RTLNAME audio_filter_hls_regslice_both BINDTYPE interface TYPE adapter IMPL reg_slice}
    }
  }
}
