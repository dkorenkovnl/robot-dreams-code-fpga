#include "xaudio_filter_hls.h"

XAudio_filter_hls_Config XAudio_filter_hls_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,audio-filter-hls-1.0", /* compatible */
		0x20000 /* reg */
	},
	 {
		 NULL
	}
};