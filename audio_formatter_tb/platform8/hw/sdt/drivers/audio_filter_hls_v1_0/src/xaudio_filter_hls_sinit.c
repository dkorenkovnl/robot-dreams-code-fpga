// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xaudio_filter_hls.h"

extern XAudio_filter_hls_Config XAudio_filter_hls_ConfigTable[];

#ifdef SDT
XAudio_filter_hls_Config *XAudio_filter_hls_LookupConfig(UINTPTR BaseAddress) {
	XAudio_filter_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAudio_filter_hls_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAudio_filter_hls_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XAudio_filter_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAudio_filter_hls_Initialize(XAudio_filter_hls *InstancePtr, UINTPTR BaseAddress) {
	XAudio_filter_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAudio_filter_hls_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAudio_filter_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAudio_filter_hls_Config *XAudio_filter_hls_LookupConfig(u16 DeviceId) {
	XAudio_filter_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XAUDIO_FILTER_HLS_NUM_INSTANCES; Index++) {
		if (XAudio_filter_hls_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAudio_filter_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAudio_filter_hls_Initialize(XAudio_filter_hls *InstancePtr, u16 DeviceId) {
	XAudio_filter_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAudio_filter_hls_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAudio_filter_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

