#include "xi2srx.h"

XI2srx_Config XI2srx_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,i2s-receiver-1.0", /* compatible */
		0x44a20000, /* reg */
		0x18, /* xlnx,dwidth */
		0x0, /* xlnx,is-master */
		0x1, /* xlnx,num-channels */
		0x1 /* xlnx,32bit-lr */
	},
	 {
		 NULL
	}
};