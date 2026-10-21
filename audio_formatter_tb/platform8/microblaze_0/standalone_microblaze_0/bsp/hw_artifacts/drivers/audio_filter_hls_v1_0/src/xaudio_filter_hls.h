// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XAUDIO_FILTER_HLS_H
#define XAUDIO_FILTER_HLS_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xaudio_filter_hls_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XAudio_filter_hls_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XAudio_filter_hls;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAudio_filter_hls_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAudio_filter_hls_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAudio_filter_hls_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAudio_filter_hls_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XAudio_filter_hls_Initialize(XAudio_filter_hls *InstancePtr, UINTPTR BaseAddress);
XAudio_filter_hls_Config* XAudio_filter_hls_LookupConfig(UINTPTR BaseAddress);
#else
int XAudio_filter_hls_Initialize(XAudio_filter_hls *InstancePtr, u16 DeviceId);
XAudio_filter_hls_Config* XAudio_filter_hls_LookupConfig(u16 DeviceId);
#endif
int XAudio_filter_hls_CfgInitialize(XAudio_filter_hls *InstancePtr, XAudio_filter_hls_Config *ConfigPtr);
#else
int XAudio_filter_hls_Initialize(XAudio_filter_hls *InstancePtr, const char* InstanceName);
int XAudio_filter_hls_Release(XAudio_filter_hls *InstancePtr);
#endif

void XAudio_filter_hls_Start(XAudio_filter_hls *InstancePtr);
u32 XAudio_filter_hls_IsDone(XAudio_filter_hls *InstancePtr);
u32 XAudio_filter_hls_IsIdle(XAudio_filter_hls *InstancePtr);
u32 XAudio_filter_hls_IsReady(XAudio_filter_hls *InstancePtr);
void XAudio_filter_hls_EnableAutoRestart(XAudio_filter_hls *InstancePtr);
void XAudio_filter_hls_DisableAutoRestart(XAudio_filter_hls *InstancePtr);

void XAudio_filter_hls_Set_bypass(XAudio_filter_hls *InstancePtr, u32 Data);
u32 XAudio_filter_hls_Get_bypass(XAudio_filter_hls *InstancePtr);

void XAudio_filter_hls_InterruptGlobalEnable(XAudio_filter_hls *InstancePtr);
void XAudio_filter_hls_InterruptGlobalDisable(XAudio_filter_hls *InstancePtr);
void XAudio_filter_hls_InterruptEnable(XAudio_filter_hls *InstancePtr, u32 Mask);
void XAudio_filter_hls_InterruptDisable(XAudio_filter_hls *InstancePtr, u32 Mask);
void XAudio_filter_hls_InterruptClear(XAudio_filter_hls *InstancePtr, u32 Mask);
u32 XAudio_filter_hls_InterruptGetEnabled(XAudio_filter_hls *InstancePtr);
u32 XAudio_filter_hls_InterruptGetStatus(XAudio_filter_hls *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
