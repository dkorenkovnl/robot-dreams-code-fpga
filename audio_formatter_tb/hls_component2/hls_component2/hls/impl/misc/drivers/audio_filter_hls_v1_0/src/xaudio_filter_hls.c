// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xaudio_filter_hls.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAudio_filter_hls_CfgInitialize(XAudio_filter_hls *InstancePtr, XAudio_filter_hls_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAudio_filter_hls_Start(XAudio_filter_hls *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL) & 0x80;
    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAudio_filter_hls_IsDone(XAudio_filter_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAudio_filter_hls_IsIdle(XAudio_filter_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAudio_filter_hls_IsReady(XAudio_filter_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAudio_filter_hls_EnableAutoRestart(XAudio_filter_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XAudio_filter_hls_DisableAutoRestart(XAudio_filter_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_AP_CTRL, 0);
}

void XAudio_filter_hls_Set_bypass(XAudio_filter_hls *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_BYPASS_DATA, Data);
}

u32 XAudio_filter_hls_Get_bypass(XAudio_filter_hls *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_BYPASS_DATA);
    return Data;
}

void XAudio_filter_hls_InterruptGlobalEnable(XAudio_filter_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_GIE, 1);
}

void XAudio_filter_hls_InterruptGlobalDisable(XAudio_filter_hls *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_GIE, 0);
}

void XAudio_filter_hls_InterruptEnable(XAudio_filter_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_IER);
    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_IER, Register | Mask);
}

void XAudio_filter_hls_InterruptDisable(XAudio_filter_hls *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_IER);
    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_IER, Register & (~Mask));
}

void XAudio_filter_hls_InterruptClear(XAudio_filter_hls *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAudio_filter_hls_WriteReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_ISR, Mask);
}

u32 XAudio_filter_hls_InterruptGetEnabled(XAudio_filter_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_IER);
}

u32 XAudio_filter_hls_InterruptGetStatus(XAudio_filter_hls *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAudio_filter_hls_ReadReg(InstancePtr->Control_BaseAddress, XAUDIO_FILTER_HLS_CONTROL_ADDR_ISR);
}

