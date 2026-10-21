set moduleName audio_filter_hls
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type function_flushable
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 2
set C_modelName {audio_filter_hls}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ s_axis_V_data_V int 32 regular {axi_s 0 volatile  { s_axis Data } }  }
	{ s_axis_V_id_V int 3 regular {axi_s 0 volatile  { s_axis ID } }  }
	{ m_axis_V_data_V int 32 regular {axi_s 1 volatile  { m_axis Data } }  }
	{ m_axis_V_id_V int 3 regular {axi_s 1 volatile  { m_axis ID } }  }
	{ bypass int 1 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_V_id_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "m_axis_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "m_axis_V_id_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bypass", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axis_TVALID sc_in sc_logic 1 invld 1 } 
	{ m_axis_TREADY sc_in sc_logic 1 outacc 3 } 
	{ s_axis_TDATA sc_in sc_lv 32 signal 0 } 
	{ s_axis_TREADY sc_out sc_logic 1 inacc 1 } 
	{ s_axis_TID sc_in sc_lv 3 signal 1 } 
	{ m_axis_TDATA sc_out sc_lv 32 signal 2 } 
	{ m_axis_TVALID sc_out sc_logic 1 outvld 3 } 
	{ m_axis_TID sc_out sc_lv 3 signal 3 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"audio_filter_hls","role":"start","value":"0","valid_bit":"0"},{"name":"audio_filter_hls","role":"continue","value":"0","valid_bit":"4"},{"name":"audio_filter_hls","role":"auto_start","value":"0","valid_bit":"7"},{"name":"bypass","role":"data","value":"32"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"audio_filter_hls","role":"start","value":"0","valid_bit":"0"},{"name":"audio_filter_hls","role":"done","value":"0","valid_bit":"1"},{"name":"audio_filter_hls","role":"idle","value":"0","valid_bit":"2"},{"name":"audio_filter_hls","role":"ready","value":"0","valid_bit":"3"},{"name":"audio_filter_hls","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "s_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "m_axis_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_axis_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_V_id_V", "role": "default" }} , 
 	{ "name": "s_axis_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "s_axis_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_axis_V_data_V", "role": "default" }} , 
 	{ "name": "m_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "m_axis_V_id_V", "role": "default" }} , 
 	{ "name": "m_axis_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_axis_V_id_V", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	audio_filter_hls {
		s_axis_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_V_id_V {Type I LastRead 0 FirstWrite -1}
		m_axis_V_data_V {Type O LastRead -1 FirstWrite 2}
		m_axis_V_id_V {Type O LastRead -1 FirstWrite 2}
		bypass {Type I LastRead 0 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_55 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_48 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_41 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_34 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_27 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_20 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_13 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_6 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_54 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_47 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_40 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_33 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_26 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_19 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_12 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_5 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_53 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_46 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_39 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_32 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_25 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_18 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_11 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_4 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_52 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_45 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_38 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_31 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_24 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_17 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_3 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_51 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_44 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_37 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_30 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_23 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_16 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_9 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_2 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_50 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_43 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_36 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_29 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_22 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_15 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_8 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_1 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_49 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_42 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_35 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_28 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_21 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_14 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE_7 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ16audio_filter_hlsRN3hls6streamINS_4axisI7ap_uintILi32EELm0ELm3ELm0ELh5ELb1EE {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_V_data_V { axis {  { s_axis_TDATA in_data 0 32 } } }
	s_axis_V_id_V { axis {  { s_axis_TVALID in_vld 0 1 }  { s_axis_TREADY in_acc 1 1 }  { s_axis_TID in_data 0 3 } } }
	m_axis_V_data_V { axis {  { m_axis_TDATA out_data 1 32 } } }
	m_axis_V_id_V { axis {  { m_axis_TREADY out_acc 0 1 }  { m_axis_TVALID out_vld 1 1 }  { m_axis_TID out_data 1 3 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
