set(axi_bram_ctrl_0_memory_0 "0xc0000000;0x40000")
set(microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0 "0x50;0x1ffb0")
set(DDR microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0)
set(CODE microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0)
set(DATA microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0)
set(TOTAL_MEM_CONTROLLERS "axi_bram_ctrl_0_memory_0;microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0")
set(MEMORY_SECTION "MEMORY
{
	axi_bram_ctrl_0_memory_0 : ORIGIN = 0xc0000000, LENGTH = 0x40000
	microblaze_0_local_memory_dlmb_bram_if_cntlr_memory_0 : ORIGIN = 0x50, LENGTH = 0x1ffb0
}")
set(STACK_SIZE 0x400)
set(HEAP_SIZE 0x800)
