; ModuleID = '/home/dmas/Xilinx_prev/verilog_2025/audio_formatter_tb/hls_component2/hls_component2/hls/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" = type { %"struct.hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>" }
%"struct.hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>" = type { %"struct.ap_uint<32>", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.ap_uint<3>", %"struct.hls::axis_disabled_signal" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.hls::axis_disabled_signal" = type { i8 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline willreturn
define void @apatb_audio_filter_hls_ir(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nonnull align 4 dereferenceable(12) %s_axis, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nonnull align 4 dereferenceable(12) %m_axis, %"struct.ap_uint<1>"* nocapture readonly %bypass) local_unnamed_addr #0 {
entry:
  %s_axis_copy.data = alloca i32, align 512
  %s_axis_copy.id = alloca i3, align 512
  %m_axis_copy.data = alloca i32, align 512
  %m_axis_copy.id = alloca i3, align 512
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* nonnull %s_axis, i32* nonnull align 512 %s_axis_copy.data, i3* nonnull align 512 %s_axis_copy.id, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* nonnull %m_axis, i32* nonnull align 512 %m_axis_copy.data, i3* nonnull align 512 %m_axis_copy.id)
  call void @apatb_audio_filter_hls_hw(i32* %s_axis_copy.data, i3* %s_axis_copy.id, i32* %m_axis_copy.data, i3* %m_axis_copy.id, %"struct.ap_uint<1>"* %bypass)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %s_axis, i32* %s_axis_copy.data, i3* %s_axis_copy.id, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %m_axis, i32* %m_axis_copy.data, i3* %m_axis_copy.id)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="1.0" %_V_data_V, i3* noalias align 512 "unpacked"="1.1" %_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="3.0" %_V_data_V1, i3* noalias align 512 "unpacked"="3.1" %_V_id_V2) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.20"(i32* align 512 %_V_data_V, i3* align 512 %_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.20"(i32* align 512 %_V_data_V1, i3* align 512 %_V_id_V2, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %1)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="1.0" %_V_data_V, i3* noalias align 512 "unpacked"="1.1" %_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="3.0" %_V_data_V1, i3* noalias align 512 "unpacked"="3.1" %_V_id_V2) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0, i32* align 512 %_V_data_V, i3* align 512 %_V_id_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %1, i32* align 512 %_V_data_V1, i3* align 512 %_V_id_V2)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias %dst, i32* noalias align 512 "unpacked"="1.0" %src_V_data_V, i3* noalias align 512 "unpacked"="1.1" %src_V_id_V) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.15"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* nonnull %dst, i32* align 512 %src_V_data_V, i3* align 512 %src_V_id_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.15"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nocapture, i32* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V, i3* noalias nocapture align 512 "unpacked"="1.1" %_V_id_V) unnamed_addr #4 {
entry:
  %1 = alloca i32
  %2 = alloca i3
  %3 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i32* %_V_data_V to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i32* %1 to i8*
  %7 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile i32, i32* %1
  %9 = bitcast i3* %2 to i8*
  %10 = bitcast i3* %_V_id_V to i8*
  call void @fpga_fifo_pop_1(i8* %9, i8* %10)
  %11 = bitcast i3* %2 to i8*
  %12 = load i8, i8* %11
  %13 = trunc i8 %12 to i3
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" undef, i32 %8, 0, 0, 0, 0, 0
  %.fca.0.5.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" %.fca.0.0.0.0.0.insert, i3 %13, 0, 5, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" %.fca.0.5.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %3
  %14 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %3 to i8*
  %15 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %14, i8* %15)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.20"(i32* noalias align 512 "unpacked"="0.0" %dst_V_data_V, i3* noalias align 512 "unpacked"="0.1" %dst_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.23"(i32* align 512 %dst_V_data_V, i3* align 512 %dst_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>.23"(i32* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, i3* noalias nocapture align 512 "unpacked"="0.1" %_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nocapture) unnamed_addr #4 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"
  %2 = alloca i32
  %3 = alloca i3
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0 to i8*
  %5 = call i1 @fpga_fifo_not_empty_12(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %1 to i8*
  %7 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" %8, 0, 0, 0, 0, 0
  %.fca.0.5.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>" %8, 0, 5, 0, 0, 0
  store i32 %.fca.0.0.0.0.0.extract, i32* %2
  %9 = bitcast i32* %2 to i8*
  %10 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %9, i8* %10)
  store i3 %.fca.0.5.0.0.0.extract, i3* %3
  %11 = bitcast i3* %3 to i8*
  %12 = bitcast i3* %_V_id_V to i8*
  call void @fpga_fifo_push_1(i8* %11, i8* %12)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_audio_filter_hls_hw(i32*, i3*, i32*, i3*, %"struct.ap_uint<1>"*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="1.0" %_V_data_V, i3* noalias align 512 "unpacked"="1.1" %_V_id_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias, i32* noalias align 512 "unpacked"="3.0" %_V_data_V1, i3* noalias align 512 "unpacked"="3.1" %_V_id_V2) unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %0, i32* align 512 %_V_data_V, i3* align 512 %_V_id_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %1, i32* align 512 %_V_data_V1, i3* align 512 %_V_id_V2)
  ret void
}

declare void @audio_filter_hls_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nonnull, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* noalias nonnull, %"struct.ap_uint<1>"* nocapture readonly)

define void @audio_filter_hls_hw_stub_wrapper(i32*, i3*, i32*, i3*, %"struct.ap_uint<1>"*) #5 {
entry:
  %5 = call i8* @malloc(i64 12)
  %6 = bitcast i8* %5 to %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"*
  %7 = call i8* @malloc(i64 12)
  %8 = bitcast i8* %7 to %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"*
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %6, i32* %0, i3* %1, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %8, i32* %2, i3* %3)
  call void @audio_filter_hls_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %6, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %8, %"struct.ap_uint<1>"* %4)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %6, i32* %0, i3* %1, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 3, 0, '\5Cx05', true>, 0>"* %8, i32* %2, i3* %3)
  call void @free(i8* %5)
  call void @free(i8* %7)
  ret void
}

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.rotate.disable"}
