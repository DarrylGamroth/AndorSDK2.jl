module LibAndorSDK2

using AndorSDK2_jll
export AndorSDK2_jll

using CEnum

const ULONG = Culong

const BYTE = Cuchar

const WORD = Cushort

const DWORD = Culong

const HANDLE = Ptr{Cvoid}

mutable struct HWND__
    unused::Cint
    HWND__() = new()
end

mutable struct _SYSTEMTIME
    wYear::WORD
    wMonth::WORD
    wDayOfWeek::WORD
    wDay::WORD
    wHour::WORD
    wMinute::WORD
    wSecond::WORD
    wMilliseconds::WORD
    _SYSTEMTIME() = new()
end

const SYSTEMTIME = _SYSTEMTIME

@cenum AT_VersionInfoId::UInt32 begin
    AT_SDKVersion = 1073741824
    AT_DeviceDriverVersion = 1073741825
end

@cenum AT_DDGLiteChannelId::UInt32 begin
    AT_DDGLite_ChannelA = 1073741824
    AT_DDGLite_ChannelB = 1073741825
    AT_DDGLite_ChannelC = 1073741826
end

mutable struct ANDORCAPS
    ulSize::ULONG
    ulAcqModes::ULONG
    ulReadModes::ULONG
    ulTriggerModes::ULONG
    ulCameraType::ULONG
    ulPixelMode::ULONG
    ulSetFunctions::ULONG
    ulGetFunctions::ULONG
    ulFeatures::ULONG
    ulPCICard::ULONG
    ulEMGainCapability::ULONG
    ulFTReadModes::ULONG
    ANDORCAPS() = new()
end

const AndorCapabilities = ANDORCAPS

mutable struct COLORDEMOSAICINFO
    iX::Cint
    iY::Cint
    iAlgorithm::Cint
    iXPhase::Cint
    iYPhase::Cint
    iBackground::Cint
    COLORDEMOSAICINFO() = new()
end

const ColorDemosaicInfo = COLORDEMOSAICINFO

mutable struct WHITEBALANCEINFO
    iSize::Cint
    iX::Cint
    iY::Cint
    iAlgorithm::Cint
    iROI_left::Cint
    iROI_right::Cint
    iROI_top::Cint
    iROI_bottom::Cint
    iOperation::Cint
    WHITEBALANCEINFO() = new()
end

const WhiteBalanceInfo = WHITEBALANCEINFO

"""
    AbortAcquisition()

### Prototype
```c
unsigned int WINAPI AbortAcquisition(void);
```
"""
function AbortAcquisition()
    @ccall libandor2.AbortAcquisition()::Cuint
end

"""
    CancelWait()

### Prototype
```c
unsigned int WINAPI CancelWait(void);
```
"""
function CancelWait()
    @ccall libandor2.CancelWait()::Cuint
end

"""
    CoolerOFF()

### Prototype
```c
unsigned int WINAPI CoolerOFF(void);
```
"""
function CoolerOFF()
    @ccall libandor2.CoolerOFF()::Cuint
end

"""
    CoolerON()

### Prototype
```c
unsigned int WINAPI CoolerON(void);
```
"""
function CoolerON()
    @ccall libandor2.CoolerON()::Cuint
end

"""
    DemosaicImage(grey, red, green, blue, info)

### Prototype
```c
unsigned int WINAPI DemosaicImage(WORD * grey, WORD * red, WORD * green, WORD * blue, ColorDemosaicInfo * info);
```
"""
function DemosaicImage(grey, red, green, blue, info)
    @ccall libandor2.DemosaicImage(grey::Ptr{WORD}, red::Ptr{WORD}, green::Ptr{WORD}, blue::Ptr{WORD}, info::Ptr{ColorDemosaicInfo})::Cuint
end

"""
    EnableKeepCleans(iMode)

### Prototype
```c
unsigned int WINAPI EnableKeepCleans(int iMode);
```
"""
function EnableKeepCleans(iMode)
    @ccall libandor2.EnableKeepCleans(iMode::Cint)::Cuint
end

"""
    EnableSensorCompensation(iMode)

### Prototype
```c
unsigned int WINAPI EnableSensorCompensation(int iMode);
```
"""
function EnableSensorCompensation(iMode)
    @ccall libandor2.EnableSensorCompensation(iMode::Cint)::Cuint
end

"""
    SetIRIGModulation(mode)

### Prototype
```c
unsigned int WINAPI SetIRIGModulation(char mode);
```
"""
function SetIRIGModulation(mode)
    @ccall libandor2.SetIRIGModulation(mode::Cchar)::Cuint
end

"""
    FreeInternalMemory()

### Prototype
```c
unsigned int WINAPI FreeInternalMemory(void);
```
"""
function FreeInternalMemory()
    @ccall libandor2.FreeInternalMemory()::Cuint
end

"""
    GetAcquiredData(arr, size)

### Prototype
```c
unsigned int WINAPI GetAcquiredData(at_32 * arr, unsigned long size);
```
"""
function GetAcquiredData(arr, size)
    @ccall libandor2.GetAcquiredData(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetAcquiredData16(arr, size)

### Prototype
```c
unsigned int WINAPI GetAcquiredData16(WORD * arr, unsigned long size);
```
"""
function GetAcquiredData16(arr, size)
    @ccall libandor2.GetAcquiredData16(arr::Ptr{WORD}, size::Culong)::Cuint
end

"""
    GetAcquiredFloatData(arr, size)

### Prototype
```c
unsigned int WINAPI GetAcquiredFloatData(float * arr, unsigned long size);
```
"""
function GetAcquiredFloatData(arr, size)
    @ccall libandor2.GetAcquiredFloatData(arr::Ptr{Cfloat}, size::Culong)::Cuint
end

"""
    GetAcquisitionProgress(acc, series)

### Prototype
```c
unsigned int WINAPI GetAcquisitionProgress(long * acc, long * series);
```
"""
function GetAcquisitionProgress(acc, series)
    @ccall libandor2.GetAcquisitionProgress(acc::Ptr{Clong}, series::Ptr{Clong})::Cuint
end

"""
    GetAcquisitionTimings(exposure, accumulate, kinetic)

### Prototype
```c
unsigned int WINAPI GetAcquisitionTimings(float * exposure, float * accumulate, float * kinetic);
```
"""
function GetAcquisitionTimings(exposure, accumulate, kinetic)
    @ccall libandor2.GetAcquisitionTimings(exposure::Ptr{Cfloat}, accumulate::Ptr{Cfloat}, kinetic::Ptr{Cfloat})::Cuint
end

"""
    GetAdjustedRingExposureTimes(inumTimes, fptimes)

### Prototype
```c
unsigned int WINAPI GetAdjustedRingExposureTimes(int inumTimes, float * fptimes);
```
"""
function GetAdjustedRingExposureTimes(inumTimes, fptimes)
    @ccall libandor2.GetAdjustedRingExposureTimes(inumTimes::Cint, fptimes::Ptr{Cfloat})::Cuint
end

"""
    GetAllDMAData(arr, size)

### Prototype
```c
unsigned int WINAPI GetAllDMAData(at_32 * arr, unsigned long size);
```
"""
function GetAllDMAData(arr, size)
    @ccall libandor2.GetAllDMAData(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetAmpDesc(index, name, length)

### Prototype
```c
unsigned int WINAPI GetAmpDesc(int index, char * name, int length);
```
"""
function GetAmpDesc(index, name, length)
    @ccall libandor2.GetAmpDesc(index::Cint, name::Cstring, length::Cint)::Cuint
end

"""
    GetAmpMaxSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetAmpMaxSpeed(int index, float * speed);
```
"""
function GetAmpMaxSpeed(index, speed)
    @ccall libandor2.GetAmpMaxSpeed(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetAvailableCameras(totalCameras)

### Prototype
```c
unsigned int WINAPI GetAvailableCameras(long * totalCameras);
```
"""
function GetAvailableCameras(totalCameras)
    @ccall libandor2.GetAvailableCameras(totalCameras::Ptr{Clong})::Cuint
end

"""
    GetBackground(arr, size)

### Prototype
```c
unsigned int WINAPI GetBackground(at_32 * arr, unsigned long size);
```
"""
function GetBackground(arr, size)
    @ccall libandor2.GetBackground(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetBaselineClamp(state)

### Prototype
```c
unsigned int WINAPI GetBaselineClamp(int * state);
```
"""
function GetBaselineClamp(state)
    @ccall libandor2.GetBaselineClamp(state::Ptr{Cint})::Cuint
end

"""
    GetBitDepth(channel, depth)

### Prototype
```c
unsigned int WINAPI GetBitDepth(int channel, int * depth);
```
"""
function GetBitDepth(channel, depth)
    @ccall libandor2.GetBitDepth(channel::Cint, depth::Ptr{Cint})::Cuint
end

"""
    GetCameraEventStatus(camStatus)

### Prototype
```c
unsigned int WINAPI GetCameraEventStatus(DWORD * camStatus);
```
"""
function GetCameraEventStatus(camStatus)
    @ccall libandor2.GetCameraEventStatus(camStatus::Ptr{DWORD})::Cuint
end

"""
    GetCameraHandle(cameraIndex, cameraHandle)

### Prototype
```c
unsigned int WINAPI GetCameraHandle(long cameraIndex, long * cameraHandle);
```
"""
function GetCameraHandle(cameraIndex, cameraHandle)
    @ccall libandor2.GetCameraHandle(cameraIndex::Clong, cameraHandle::Ptr{Clong})::Cuint
end

"""
    GetCameraInformation(index, information)

### Prototype
```c
unsigned int WINAPI GetCameraInformation(int index, long * information);
```
"""
function GetCameraInformation(index, information)
    @ccall libandor2.GetCameraInformation(index::Cint, information::Ptr{Clong})::Cuint
end

"""
    GetCameraSerialNumber(number)

### Prototype
```c
unsigned int WINAPI GetCameraSerialNumber(int * number);
```
"""
function GetCameraSerialNumber(number)
    @ccall libandor2.GetCameraSerialNumber(number::Ptr{Cint})::Cuint
end

"""
    GetCapabilities(caps)

### Prototype
```c
unsigned int WINAPI GetCapabilities(AndorCapabilities * caps);
```
"""
function GetCapabilities(caps)
    @ccall libandor2.GetCapabilities(caps::Ptr{AndorCapabilities})::Cuint
end

"""
    GetControllerCardModel(controllerCardModel)

### Prototype
```c
unsigned int WINAPI GetControllerCardModel(char * controllerCardModel);
```
"""
function GetControllerCardModel(controllerCardModel)
    @ccall libandor2.GetControllerCardModel(controllerCardModel::Cstring)::Cuint
end

"""
    GetCountConvertWavelengthRange(minval, maxval)

### Prototype
```c
unsigned int WINAPI GetCountConvertWavelengthRange(float * minval, float * maxval);
```
"""
function GetCountConvertWavelengthRange(minval, maxval)
    @ccall libandor2.GetCountConvertWavelengthRange(minval::Ptr{Cfloat}, maxval::Ptr{Cfloat})::Cuint
end

"""
    GetCurrentCamera(cameraHandle)

### Prototype
```c
unsigned int WINAPI GetCurrentCamera(long * cameraHandle);
```
"""
function GetCurrentCamera(cameraHandle)
    @ccall libandor2.GetCurrentCamera(cameraHandle::Ptr{Clong})::Cuint
end

"""
    GetCYMGShift(iXshift, iYShift)

### Prototype
```c
unsigned int WINAPI GetCYMGShift(int * iXshift, int * iYShift);
```
"""
function GetCYMGShift(iXshift, iYShift)
    @ccall libandor2.GetCYMGShift(iXshift::Ptr{Cint}, iYShift::Ptr{Cint})::Cuint
end

"""
    GetDDGExternalOutputEnabled(uiIndex, puiEnabled)

### Prototype
```c
unsigned int WINAPI GetDDGExternalOutputEnabled(at_u32 uiIndex, at_u32 * puiEnabled);
```
"""
function GetDDGExternalOutputEnabled(uiIndex, puiEnabled)
    @ccall libandor2.GetDDGExternalOutputEnabled(uiIndex::Culong, puiEnabled::Ptr{Culong})::Cuint
end

"""
    GetDDGExternalOutputPolarity(uiIndex, puiPolarity)

### Prototype
```c
unsigned int WINAPI GetDDGExternalOutputPolarity(at_u32 uiIndex, at_u32 * puiPolarity);
```
"""
function GetDDGExternalOutputPolarity(uiIndex, puiPolarity)
    @ccall libandor2.GetDDGExternalOutputPolarity(uiIndex::Culong, puiPolarity::Ptr{Culong})::Cuint
end

"""
    GetDDGExternalOutputStepEnabled(uiIndex, puiEnabled)

### Prototype
```c
unsigned int WINAPI GetDDGExternalOutputStepEnabled(at_u32 uiIndex, at_u32 * puiEnabled);
```
"""
function GetDDGExternalOutputStepEnabled(uiIndex, puiEnabled)
    @ccall libandor2.GetDDGExternalOutputStepEnabled(uiIndex::Culong, puiEnabled::Ptr{Culong})::Cuint
end

"""
    GetDDGExternalOutputTime(uiIndex, puiDelay, puiWidth)

### Prototype
```c
unsigned int WINAPI GetDDGExternalOutputTime(at_u32 uiIndex, at_u64 * puiDelay, at_u64 * puiWidth);
```
"""
function GetDDGExternalOutputTime(uiIndex, puiDelay, puiWidth)
    @ccall libandor2.GetDDGExternalOutputTime(uiIndex::Culong, puiDelay::Ptr{Culonglong}, puiWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGTTLGateWidth(opticalWidth, ttlWidth)

### Prototype
```c
unsigned int WINAPI GetDDGTTLGateWidth(at_u64 opticalWidth, at_u64 * ttlWidth);
```
"""
function GetDDGTTLGateWidth(opticalWidth, ttlWidth)
    @ccall libandor2.GetDDGTTLGateWidth(opticalWidth::Culonglong, ttlWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGGateTime(puiDelay, puiWidth)

### Prototype
```c
unsigned int WINAPI GetDDGGateTime(at_u64 * puiDelay, at_u64 * puiWidth);
```
"""
function GetDDGGateTime(puiDelay, puiWidth)
    @ccall libandor2.GetDDGGateTime(puiDelay::Ptr{Culonglong}, puiWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGInsertionDelay(piState)

### Prototype
```c
unsigned int WINAPI GetDDGInsertionDelay(int * piState);
```
"""
function GetDDGInsertionDelay(piState)
    @ccall libandor2.GetDDGInsertionDelay(piState::Ptr{Cint})::Cuint
end

"""
    GetDDGIntelligate(piState)

### Prototype
```c
unsigned int WINAPI GetDDGIntelligate(int * piState);
```
"""
function GetDDGIntelligate(piState)
    @ccall libandor2.GetDDGIntelligate(piState::Ptr{Cint})::Cuint
end

"""
    GetDDGIOC(state)

### Prototype
```c
unsigned int WINAPI GetDDGIOC(int * state);
```
"""
function GetDDGIOC(state)
    @ccall libandor2.GetDDGIOC(state::Ptr{Cint})::Cuint
end

"""
    GetDDGIOCFrequency(frequency)

### Prototype
```c
unsigned int WINAPI GetDDGIOCFrequency(double * frequency);
```
"""
function GetDDGIOCFrequency(frequency)
    @ccall libandor2.GetDDGIOCFrequency(frequency::Ptr{Cdouble})::Cuint
end

"""
    GetDDGIOCNumber(numberPulses)

### Prototype
```c
unsigned int WINAPI GetDDGIOCNumber(unsigned long * numberPulses);
```
"""
function GetDDGIOCNumber(numberPulses)
    @ccall libandor2.GetDDGIOCNumber(numberPulses::Ptr{Culong})::Cuint
end

"""
    GetDDGIOCNumberRequested(pulses)

### Prototype
```c
unsigned int WINAPI GetDDGIOCNumberRequested(at_u32 * pulses);
```
"""
function GetDDGIOCNumberRequested(pulses)
    @ccall libandor2.GetDDGIOCNumberRequested(pulses::Ptr{Culong})::Cuint
end

"""
    GetDDGIOCPeriod(period)

### Prototype
```c
unsigned int WINAPI GetDDGIOCPeriod(at_u64 * period);
```
"""
function GetDDGIOCPeriod(period)
    @ccall libandor2.GetDDGIOCPeriod(period::Ptr{Culonglong})::Cuint
end

"""
    GetDDGIOCPulses(pulses)

### Prototype
```c
unsigned int WINAPI GetDDGIOCPulses(int * pulses);
```
"""
function GetDDGIOCPulses(pulses)
    @ccall libandor2.GetDDGIOCPulses(pulses::Ptr{Cint})::Cuint
end

"""
    GetDDGIOCTrigger(trigger)

### Prototype
```c
unsigned int WINAPI GetDDGIOCTrigger(at_u32 * trigger);
```
"""
function GetDDGIOCTrigger(trigger)
    @ccall libandor2.GetDDGIOCTrigger(trigger::Ptr{Culong})::Cuint
end

"""
    GetDDGOpticalWidthEnabled(puiEnabled)

### Prototype
```c
unsigned int WINAPI GetDDGOpticalWidthEnabled(at_u32 * puiEnabled);
```
"""
function GetDDGOpticalWidthEnabled(puiEnabled)
    @ccall libandor2.GetDDGOpticalWidthEnabled(puiEnabled::Ptr{Culong})::Cuint
end

"""
    GetDDGLiteGlobalControlByte(control)

### Prototype
```c
unsigned int WINAPI GetDDGLiteGlobalControlByte(unsigned char * control);
```
"""
function GetDDGLiteGlobalControlByte(control)
    @ccall libandor2.GetDDGLiteGlobalControlByte(control::Ptr{Cuchar})::Cuint
end

"""
    GetDDGLiteControlByte(channel, control)

### Prototype
```c
unsigned int WINAPI GetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char * control);
```
"""
function GetDDGLiteControlByte(channel, control)
    @ccall libandor2.GetDDGLiteControlByte(channel::AT_DDGLiteChannelId, control::Ptr{Cuchar})::Cuint
end

"""
    GetDDGLiteInitialDelay(channel, fDelay)

### Prototype
```c
unsigned int WINAPI GetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float * fDelay);
```
"""
function GetDDGLiteInitialDelay(channel, fDelay)
    @ccall libandor2.GetDDGLiteInitialDelay(channel::AT_DDGLiteChannelId, fDelay::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLitePulseWidth(channel, fWidth)

### Prototype
```c
unsigned int WINAPI GetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float * fWidth);
```
"""
function GetDDGLitePulseWidth(channel, fWidth)
    @ccall libandor2.GetDDGLitePulseWidth(channel::AT_DDGLiteChannelId, fWidth::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLiteInterPulseDelay(channel, fDelay)

### Prototype
```c
unsigned int WINAPI GetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float * fDelay);
```
"""
function GetDDGLiteInterPulseDelay(channel, fDelay)
    @ccall libandor2.GetDDGLiteInterPulseDelay(channel::AT_DDGLiteChannelId, fDelay::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLitePulsesPerExposure(channel, ui32Pulses)

### Prototype
```c
unsigned int WINAPI GetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, at_u32 * ui32Pulses);
```
"""
function GetDDGLitePulsesPerExposure(channel, ui32Pulses)
    @ccall libandor2.GetDDGLitePulsesPerExposure(channel::AT_DDGLiteChannelId, ui32Pulses::Ptr{Culong})::Cuint
end

"""
    GetDDGPulse(wid, resolution, Delay, Width)

### Prototype
```c
unsigned int WINAPI GetDDGPulse(double wid, double resolution, double * Delay, double * Width);
```
"""
function GetDDGPulse(wid, resolution, Delay, Width)
    @ccall libandor2.GetDDGPulse(wid::Cdouble, resolution::Cdouble, Delay::Ptr{Cdouble}, Width::Ptr{Cdouble})::Cuint
end

"""
    GetDDGStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int WINAPI GetDDGStepCoefficients(at_u32 mode, double * p1, double * p2);
```
"""
function GetDDGStepCoefficients(mode, p1, p2)
    @ccall libandor2.GetDDGStepCoefficients(mode::Culong, p1::Ptr{Cdouble}, p2::Ptr{Cdouble})::Cuint
end

"""
    GetDDGWidthStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int WINAPI GetDDGWidthStepCoefficients(at_u32 mode, double * p1, double * p2);
```
"""
function GetDDGWidthStepCoefficients(mode, p1, p2)
    @ccall libandor2.GetDDGWidthStepCoefficients(mode::Culong, p1::Ptr{Cdouble}, p2::Ptr{Cdouble})::Cuint
end

"""
    GetDDGStepMode(mode)

### Prototype
```c
unsigned int WINAPI GetDDGStepMode(at_u32 * mode);
```
"""
function GetDDGStepMode(mode)
    @ccall libandor2.GetDDGStepMode(mode::Ptr{Culong})::Cuint
end

"""
    GetDDGWidthStepMode(mode)

### Prototype
```c
unsigned int WINAPI GetDDGWidthStepMode(at_u32 * mode);
```
"""
function GetDDGWidthStepMode(mode)
    @ccall libandor2.GetDDGWidthStepMode(mode::Ptr{Culong})::Cuint
end

"""
    GetDetector(xpixels, ypixels)

### Prototype
```c
unsigned int WINAPI GetDetector(int * xpixels, int * ypixels);
```
"""
function GetDetector(xpixels, ypixels)
    @ccall libandor2.GetDetector(xpixels::Ptr{Cint}, ypixels::Ptr{Cint})::Cuint
end

"""
    GetDICameraInfo(info)

### Prototype
```c
unsigned int WINAPI GetDICameraInfo(void * info);
```
"""
function GetDICameraInfo(info)
    @ccall libandor2.GetDICameraInfo(info::Ptr{Cvoid})::Cuint
end

"""
    GetEMAdvanced(state)

### Prototype
```c
unsigned int WINAPI GetEMAdvanced(int * state);
```
"""
function GetEMAdvanced(state)
    @ccall libandor2.GetEMAdvanced(state::Ptr{Cint})::Cuint
end

"""
    GetEMCCDGain(gain)

### Prototype
```c
unsigned int WINAPI GetEMCCDGain(int * gain);
```
"""
function GetEMCCDGain(gain)
    @ccall libandor2.GetEMCCDGain(gain::Ptr{Cint})::Cuint
end

"""
    GetEMGainRange(low, high)

### Prototype
```c
unsigned int WINAPI GetEMGainRange(int * low, int * high);
```
"""
function GetEMGainRange(low, high)
    @ccall libandor2.GetEMGainRange(low::Ptr{Cint}, high::Ptr{Cint})::Cuint
end

"""
    GetExternalTriggerTermination(puiTermination)

### Prototype
```c
unsigned int WINAPI GetExternalTriggerTermination(at_u32 * puiTermination);
```
"""
function GetExternalTriggerTermination(puiTermination)
    @ccall libandor2.GetExternalTriggerTermination(puiTermination::Ptr{Culong})::Cuint
end

"""
    GetFastestRecommendedVSSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetFastestRecommendedVSSpeed(int * index, float * speed);
```
"""
function GetFastestRecommendedVSSpeed(index, speed)
    @ccall libandor2.GetFastestRecommendedVSSpeed(index::Ptr{Cint}, speed::Ptr{Cfloat})::Cuint
end

"""
    GetFIFOUsage(FIFOusage)

### Prototype
```c
unsigned int WINAPI GetFIFOUsage(int * FIFOusage);
```
"""
function GetFIFOUsage(FIFOusage)
    @ccall libandor2.GetFIFOUsage(FIFOusage::Ptr{Cint})::Cuint
end

"""
    GetFilterMode(mode)

### Prototype
```c
unsigned int WINAPI GetFilterMode(int * mode);
```
"""
function GetFilterMode(mode)
    @ccall libandor2.GetFilterMode(mode::Ptr{Cint})::Cuint
end

"""
    GetFKExposureTime(time)

### Prototype
```c
unsigned int WINAPI GetFKExposureTime(float * time);
```
"""
function GetFKExposureTime(time)
    @ccall libandor2.GetFKExposureTime(time::Ptr{Cfloat})::Cuint
end

"""
    GetFKVShiftSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetFKVShiftSpeed(int index, int * speed);
```
"""
function GetFKVShiftSpeed(index, speed)
    @ccall libandor2.GetFKVShiftSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetFKVShiftSpeedF(index, speed)

### Prototype
```c
unsigned int WINAPI GetFKVShiftSpeedF(int index, float * speed);
```
"""
function GetFKVShiftSpeedF(index, speed)
    @ccall libandor2.GetFKVShiftSpeedF(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetFrontEndStatus(piFlag)

### Prototype
```c
unsigned int WINAPI GetFrontEndStatus(int * piFlag);
```
"""
function GetFrontEndStatus(piFlag)
    @ccall libandor2.GetFrontEndStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetGateMode(piGatemode)

### Prototype
```c
unsigned int WINAPI GetGateMode(int * piGatemode);
```
"""
function GetGateMode(piGatemode)
    @ccall libandor2.GetGateMode(piGatemode::Ptr{Cint})::Cuint
end

"""
    GetHardwareVersion(PCB, Decode, dummy1, dummy2, CameraFirmwareVersion, CameraFirmwareBuild)

### Prototype
```c
unsigned int WINAPI GetHardwareVersion(unsigned int * PCB, unsigned int * Decode, unsigned int * dummy1, unsigned int * dummy2, unsigned int * CameraFirmwareVersion, unsigned int * CameraFirmwareBuild);
```
"""
function GetHardwareVersion(PCB, Decode, dummy1, dummy2, CameraFirmwareVersion, CameraFirmwareBuild)
    @ccall libandor2.GetHardwareVersion(PCB::Ptr{Cuint}, Decode::Ptr{Cuint}, dummy1::Ptr{Cuint}, dummy2::Ptr{Cuint}, CameraFirmwareVersion::Ptr{Cuint}, CameraFirmwareBuild::Ptr{Cuint})::Cuint
end

"""
    GetHeadModel(name)

### Prototype
```c
unsigned int WINAPI GetHeadModel(char * name);
```
"""
function GetHeadModel(name)
    @ccall libandor2.GetHeadModel(name::Cstring)::Cuint
end

"""
    GetHorizontalSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetHorizontalSpeed(int index, int * speed);
```
"""
function GetHorizontalSpeed(index, speed)
    @ccall libandor2.GetHorizontalSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetHSSpeed(channel, typ, index, speed)

### Prototype
```c
unsigned int WINAPI GetHSSpeed(int channel, int typ, int index, float * speed);
```
"""
function GetHSSpeed(channel, typ, index, speed)
    @ccall libandor2.GetHSSpeed(channel::Cint, typ::Cint, index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetHVflag(bFlag)

### Prototype
```c
unsigned int WINAPI GetHVflag(int * bFlag);
```
"""
function GetHVflag(bFlag)
    @ccall libandor2.GetHVflag(bFlag::Ptr{Cint})::Cuint
end

"""
    GetID(devNum, id)

### Prototype
```c
unsigned int WINAPI GetID(int devNum, int * id);
```
"""
function GetID(devNum, id)
    @ccall libandor2.GetID(devNum::Cint, id::Ptr{Cint})::Cuint
end

"""
    GetImageFlip(iHFlip, iVFlip)

### Prototype
```c
unsigned int WINAPI GetImageFlip(int * iHFlip, int * iVFlip);
```
"""
function GetImageFlip(iHFlip, iVFlip)
    @ccall libandor2.GetImageFlip(iHFlip::Ptr{Cint}, iVFlip::Ptr{Cint})::Cuint
end

"""
    GetImageRotate(iRotate)

### Prototype
```c
unsigned int WINAPI GetImageRotate(int * iRotate);
```
"""
function GetImageRotate(iRotate)
    @ccall libandor2.GetImageRotate(iRotate::Ptr{Cint})::Cuint
end

"""
    GetImages(first, last, arr, size, validfirst, validlast)

### Prototype
```c
unsigned int WINAPI GetImages(long first, long last, at_32 * arr, unsigned long size, long * validfirst, long * validlast);
```
"""
function GetImages(first, last, arr, size, validfirst, validlast)
    @ccall libandor2.GetImages(first::Clong, last::Clong, arr::Ptr{Clong}, size::Culong, validfirst::Ptr{Clong}, validlast::Ptr{Clong})::Cuint
end

"""
    GetImages16(first, last, arr, size, validfirst, validlast)

### Prototype
```c
unsigned int WINAPI GetImages16(long first, long last, WORD * arr, unsigned long size, long * validfirst, long * validlast);
```
"""
function GetImages16(first, last, arr, size, validfirst, validlast)
    @ccall libandor2.GetImages16(first::Clong, last::Clong, arr::Ptr{WORD}, size::Culong, validfirst::Ptr{Clong}, validlast::Ptr{Clong})::Cuint
end

"""
    GetImagesPerDMA(images)

### Prototype
```c
unsigned int WINAPI GetImagesPerDMA(unsigned long * images);
```
"""
function GetImagesPerDMA(images)
    @ccall libandor2.GetImagesPerDMA(images::Ptr{Culong})::Cuint
end

"""
    GetIRQ(IRQ)

### Prototype
```c
unsigned int WINAPI GetIRQ(int * IRQ);
```
"""
function GetIRQ(IRQ)
    @ccall libandor2.GetIRQ(IRQ::Ptr{Cint})::Cuint
end

"""
    GetKeepCleanTime(KeepCleanTime)

### Prototype
```c
unsigned int WINAPI GetKeepCleanTime(float * KeepCleanTime);
```
"""
function GetKeepCleanTime(KeepCleanTime)
    @ccall libandor2.GetKeepCleanTime(KeepCleanTime::Ptr{Cfloat})::Cuint
end

"""
    GetMaximumBinning(ReadMode, HorzVert, MaxBinning)

### Prototype
```c
unsigned int WINAPI GetMaximumBinning(int ReadMode, int HorzVert, int * MaxBinning);
```
"""
function GetMaximumBinning(ReadMode, HorzVert, MaxBinning)
    @ccall libandor2.GetMaximumBinning(ReadMode::Cint, HorzVert::Cint, MaxBinning::Ptr{Cint})::Cuint
end

"""
    GetMaximumExposure(MaxExp)

### Prototype
```c
unsigned int WINAPI GetMaximumExposure(float * MaxExp);
```
"""
function GetMaximumExposure(MaxExp)
    @ccall libandor2.GetMaximumExposure(MaxExp::Ptr{Cfloat})::Cuint
end

"""
    GetMaximumNumberRingExposureTimes(number)

### Prototype
```c
unsigned int WINAPI GetMaximumNumberRingExposureTimes(int * number);
```
"""
function GetMaximumNumberRingExposureTimes(number)
    @ccall libandor2.GetMaximumNumberRingExposureTimes(number::Ptr{Cint})::Cuint
end

"""
    GetMCPGain(piGain)

### Prototype
```c
unsigned int WINAPI GetMCPGain(int * piGain);
```
"""
function GetMCPGain(piGain)
    @ccall libandor2.GetMCPGain(piGain::Ptr{Cint})::Cuint
end

"""
    GetMCPGainRange(iLow, iHigh)

### Prototype
```c
unsigned int WINAPI GetMCPGainRange(int * iLow, int * iHigh);
```
"""
function GetMCPGainRange(iLow, iHigh)
    @ccall libandor2.GetMCPGainRange(iLow::Ptr{Cint}, iHigh::Ptr{Cint})::Cuint
end

"""
    GetMCPGainTable(iNum, piGain, pfPhotoepc)

### Prototype
```c
unsigned int WINAPI GetMCPGainTable(int iNum, int * piGain, float * pfPhotoepc);
```
"""
function GetMCPGainTable(iNum, piGain, pfPhotoepc)
    @ccall libandor2.GetMCPGainTable(iNum::Cint, piGain::Ptr{Cint}, pfPhotoepc::Ptr{Cfloat})::Cuint
end

"""
    GetMCPVoltage(iVoltage)

### Prototype
```c
unsigned int WINAPI GetMCPVoltage(int * iVoltage);
```
"""
function GetMCPVoltage(iVoltage)
    @ccall libandor2.GetMCPVoltage(iVoltage::Ptr{Cint})::Cuint
end

"""
    GetMinimumImageLength(MinImageLength)

### Prototype
```c
unsigned int WINAPI GetMinimumImageLength(int * MinImageLength);
```
"""
function GetMinimumImageLength(MinImageLength)
    @ccall libandor2.GetMinimumImageLength(MinImageLength::Ptr{Cint})::Cuint
end

"""
    GetMinimumNumberInSeries(number)

### Prototype
```c
unsigned int WINAPI GetMinimumNumberInSeries(int * number);
```
"""
function GetMinimumNumberInSeries(number)
    @ccall libandor2.GetMinimumNumberInSeries(number::Ptr{Cint})::Cuint
end

"""
    GetMostRecentColorImage16(size, algorithm, red, green, blue)

### Prototype
```c
unsigned int WINAPI GetMostRecentColorImage16(unsigned long size, int algorithm, WORD * red, WORD * green, WORD * blue);
```
"""
function GetMostRecentColorImage16(size, algorithm, red, green, blue)
    @ccall libandor2.GetMostRecentColorImage16(size::Culong, algorithm::Cint, red::Ptr{WORD}, green::Ptr{WORD}, blue::Ptr{WORD})::Cuint
end

"""
    GetMostRecentImage(arr, size)

### Prototype
```c
unsigned int WINAPI GetMostRecentImage(at_32 * arr, unsigned long size);
```
"""
function GetMostRecentImage(arr, size)
    @ccall libandor2.GetMostRecentImage(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetMostRecentImage16(arr, size)

### Prototype
```c
unsigned int WINAPI GetMostRecentImage16(WORD * arr, unsigned long size);
```
"""
function GetMostRecentImage16(arr, size)
    @ccall libandor2.GetMostRecentImage16(arr::Ptr{WORD}, size::Culong)::Cuint
end

"""
    GetMSTimingsData(TimeOfStart, pfDifferences, inoOfImages)

### Prototype
```c
unsigned int WINAPI GetMSTimingsData(SYSTEMTIME * TimeOfStart, float * pfDifferences, int inoOfImages);
```
"""
function GetMSTimingsData(TimeOfStart, pfDifferences, inoOfImages)
    @ccall libandor2.GetMSTimingsData(TimeOfStart::Ptr{SYSTEMTIME}, pfDifferences::Ptr{Cfloat}, inoOfImages::Cint)::Cuint
end

"""
    GetMetaDataInfo(TimeOfStart, pfTimeFromStart, index)

### Prototype
```c
unsigned int WINAPI GetMetaDataInfo(SYSTEMTIME * TimeOfStart, float * pfTimeFromStart, unsigned int index);
```
"""
function GetMetaDataInfo(TimeOfStart, pfTimeFromStart, index)
    @ccall libandor2.GetMetaDataInfo(TimeOfStart::Ptr{SYSTEMTIME}, pfTimeFromStart::Ptr{Cfloat}, index::Cuint)::Cuint
end

"""
    GetMSTimingsEnabled()

### Prototype
```c
unsigned int WINAPI GetMSTimingsEnabled(void);
```
"""
function GetMSTimingsEnabled()
    @ccall libandor2.GetMSTimingsEnabled()::Cuint
end

"""
    GetNewData(arr, size)

### Prototype
```c
unsigned int WINAPI GetNewData(at_32 * arr, unsigned long size);
```
"""
function GetNewData(arr, size)
    @ccall libandor2.GetNewData(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetNewData16(arr, size)

### Prototype
```c
unsigned int WINAPI GetNewData16(WORD * arr, unsigned long size);
```
"""
function GetNewData16(arr, size)
    @ccall libandor2.GetNewData16(arr::Ptr{WORD}, size::Culong)::Cuint
end

"""
    GetNewData8(arr, size)

### Prototype
```c
unsigned int WINAPI GetNewData8(unsigned char * arr, unsigned long size);
```
"""
function GetNewData8(arr, size)
    @ccall libandor2.GetNewData8(arr::Ptr{Cuchar}, size::Culong)::Cuint
end

"""
    GetNewFloatData(arr, size)

### Prototype
```c
unsigned int WINAPI GetNewFloatData(float * arr, unsigned long size);
```
"""
function GetNewFloatData(arr, size)
    @ccall libandor2.GetNewFloatData(arr::Ptr{Cfloat}, size::Culong)::Cuint
end

"""
    GetNumberADChannels(channels)

### Prototype
```c
unsigned int WINAPI GetNumberADChannels(int * channels);
```
"""
function GetNumberADChannels(channels)
    @ccall libandor2.GetNumberADChannels(channels::Ptr{Cint})::Cuint
end

"""
    GetNumberAmp(amp)

### Prototype
```c
unsigned int WINAPI GetNumberAmp(int * amp);
```
"""
function GetNumberAmp(amp)
    @ccall libandor2.GetNumberAmp(amp::Ptr{Cint})::Cuint
end

"""
    GetNumberAvailableImages(first, last)

### Prototype
```c
unsigned int WINAPI GetNumberAvailableImages(at_32 * first, at_32 * last);
```
"""
function GetNumberAvailableImages(first, last)
    @ccall libandor2.GetNumberAvailableImages(first::Ptr{Clong}, last::Ptr{Clong})::Cuint
end

"""
    GetNumberDDGExternalOutputs(puiCount)

### Prototype
```c
unsigned int WINAPI GetNumberDDGExternalOutputs(at_u32 * puiCount);
```
"""
function GetNumberDDGExternalOutputs(puiCount)
    @ccall libandor2.GetNumberDDGExternalOutputs(puiCount::Ptr{Culong})::Cuint
end

"""
    GetNumberDevices(numDevs)

### Prototype
```c
unsigned int WINAPI GetNumberDevices(int * numDevs);
```
"""
function GetNumberDevices(numDevs)
    @ccall libandor2.GetNumberDevices(numDevs::Ptr{Cint})::Cuint
end

"""
    GetNumberFKVShiftSpeeds(number)

### Prototype
```c
unsigned int WINAPI GetNumberFKVShiftSpeeds(int * number);
```
"""
function GetNumberFKVShiftSpeeds(number)
    @ccall libandor2.GetNumberFKVShiftSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberHorizontalSpeeds(number)

### Prototype
```c
unsigned int WINAPI GetNumberHorizontalSpeeds(int * number);
```
"""
function GetNumberHorizontalSpeeds(number)
    @ccall libandor2.GetNumberHorizontalSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberHSSpeeds(channel, typ, speeds)

### Prototype
```c
unsigned int WINAPI GetNumberHSSpeeds(int channel, int typ, int * speeds);
```
"""
function GetNumberHSSpeeds(channel, typ, speeds)
    @ccall libandor2.GetNumberHSSpeeds(channel::Cint, typ::Cint, speeds::Ptr{Cint})::Cuint
end

"""
    GetNumberMissedExternalTriggers(first, last, arr, size)

### Prototype
```c
unsigned int WINAPI GetNumberMissedExternalTriggers(unsigned int first, unsigned int last, WORD * arr, unsigned int size);
```
"""
function GetNumberMissedExternalTriggers(first, last, arr, size)
    @ccall libandor2.GetNumberMissedExternalTriggers(first::Cuint, last::Cuint, arr::Ptr{WORD}, size::Cuint)::Cuint
end

"""
    GetIRIGData(_uc_irigData, _ui_index)

### Prototype
```c
unsigned int WINAPI GetIRIGData(unsigned char * _uc_irigData, unsigned int _ui_index);
```
"""
function GetIRIGData(_uc_irigData, _ui_index)
    @ccall libandor2.GetIRIGData(_uc_irigData::Ptr{Cuchar}, _ui_index::Cuint)::Cuint
end

"""
    GetNumberNewImages(first, last)

### Prototype
```c
unsigned int WINAPI GetNumberNewImages(long * first, long * last);
```
"""
function GetNumberNewImages(first, last)
    @ccall libandor2.GetNumberNewImages(first::Ptr{Clong}, last::Ptr{Clong})::Cuint
end

"""
    GetNumberPhotonCountingDivisions(noOfDivisions)

### Prototype
```c
unsigned int WINAPI GetNumberPhotonCountingDivisions(at_u32 * noOfDivisions);
```
"""
function GetNumberPhotonCountingDivisions(noOfDivisions)
    @ccall libandor2.GetNumberPhotonCountingDivisions(noOfDivisions::Ptr{Culong})::Cuint
end

"""
    GetNumberPreAmpGains(noGains)

### Prototype
```c
unsigned int WINAPI GetNumberPreAmpGains(int * noGains);
```
"""
function GetNumberPreAmpGains(noGains)
    @ccall libandor2.GetNumberPreAmpGains(noGains::Ptr{Cint})::Cuint
end

"""
    GetNumberRingExposureTimes(ipnumTimes)

### Prototype
```c
unsigned int WINAPI GetNumberRingExposureTimes(int * ipnumTimes);
```
"""
function GetNumberRingExposureTimes(ipnumTimes)
    @ccall libandor2.GetNumberRingExposureTimes(ipnumTimes::Ptr{Cint})::Cuint
end

"""
    GetNumberIO(iNumber)

### Prototype
```c
unsigned int WINAPI GetNumberIO(int * iNumber);
```
"""
function GetNumberIO(iNumber)
    @ccall libandor2.GetNumberIO(iNumber::Ptr{Cint})::Cuint
end

"""
    GetNumberVerticalSpeeds(number)

### Prototype
```c
unsigned int WINAPI GetNumberVerticalSpeeds(int * number);
```
"""
function GetNumberVerticalSpeeds(number)
    @ccall libandor2.GetNumberVerticalSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberVSAmplitudes(number)

### Prototype
```c
unsigned int WINAPI GetNumberVSAmplitudes(int * number);
```
"""
function GetNumberVSAmplitudes(number)
    @ccall libandor2.GetNumberVSAmplitudes(number::Ptr{Cint})::Cuint
end

"""
    GetNumberVSSpeeds(speeds)

### Prototype
```c
unsigned int WINAPI GetNumberVSSpeeds(int * speeds);
```
"""
function GetNumberVSSpeeds(speeds)
    @ccall libandor2.GetNumberVSSpeeds(speeds::Ptr{Cint})::Cuint
end

"""
    GetOldestImage(arr, size)

### Prototype
```c
unsigned int WINAPI GetOldestImage(at_32 * arr, unsigned long size);
```
"""
function GetOldestImage(arr, size)
    @ccall libandor2.GetOldestImage(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    GetOldestImage16(arr, size)

### Prototype
```c
unsigned int WINAPI GetOldestImage16(WORD * arr, unsigned long size);
```
"""
function GetOldestImage16(arr, size)
    @ccall libandor2.GetOldestImage16(arr::Ptr{WORD}, size::Culong)::Cuint
end

"""
    GetPhosphorStatus(piFlag)

### Prototype
```c
unsigned int WINAPI GetPhosphorStatus(int * piFlag);
```
"""
function GetPhosphorStatus(piFlag)
    @ccall libandor2.GetPhosphorStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetPhysicalDMAAddress(Address1, Address2)

### Prototype
```c
unsigned int WINAPI GetPhysicalDMAAddress(unsigned long * Address1, unsigned long * Address2);
```
"""
function GetPhysicalDMAAddress(Address1, Address2)
    @ccall libandor2.GetPhysicalDMAAddress(Address1::Ptr{Culong}, Address2::Ptr{Culong})::Cuint
end

"""
    GetPixelSize(xSize, ySize)

### Prototype
```c
unsigned int WINAPI GetPixelSize(float * xSize, float * ySize);
```
"""
function GetPixelSize(xSize, ySize)
    @ccall libandor2.GetPixelSize(xSize::Ptr{Cfloat}, ySize::Ptr{Cfloat})::Cuint
end

"""
    GetPreAmpGain(index, gain)

### Prototype
```c
unsigned int WINAPI GetPreAmpGain(int index, float * gain);
```
"""
function GetPreAmpGain(index, gain)
    @ccall libandor2.GetPreAmpGain(index::Cint, gain::Ptr{Cfloat})::Cuint
end

"""
    GetPreAmpGainText(index, name, length)

### Prototype
```c
unsigned int WINAPI GetPreAmpGainText(int index, char * name, int length);
```
"""
function GetPreAmpGainText(index, name, length)
    @ccall libandor2.GetPreAmpGainText(index::Cint, name::Cstring, length::Cint)::Cuint
end

"""
    GetDualExposureTimes(exposure1, exposure2)

### Prototype
```c
unsigned int WINAPI GetDualExposureTimes(float * exposure1, float * exposure2);
```
"""
function GetDualExposureTimes(exposure1, exposure2)
    @ccall libandor2.GetDualExposureTimes(exposure1::Ptr{Cfloat}, exposure2::Ptr{Cfloat})::Cuint
end

"""
    GetQE(sensor, wavelength, mode, QE)

### Prototype
```c
unsigned int WINAPI GetQE(char * sensor, float wavelength, unsigned int mode, float * QE);
```
"""
function GetQE(sensor, wavelength, mode, QE)
    @ccall libandor2.GetQE(sensor::Cstring, wavelength::Cfloat, mode::Cuint, QE::Ptr{Cfloat})::Cuint
end

"""
    GetReadOutTime(ReadOutTime)

### Prototype
```c
unsigned int WINAPI GetReadOutTime(float * ReadOutTime);
```
"""
function GetReadOutTime(ReadOutTime)
    @ccall libandor2.GetReadOutTime(ReadOutTime::Ptr{Cfloat})::Cuint
end

"""
    GetRegisterDump(mode)

### Prototype
```c
unsigned int WINAPI GetRegisterDump(int * mode);
```
"""
function GetRegisterDump(mode)
    @ccall libandor2.GetRegisterDump(mode::Ptr{Cint})::Cuint
end

"""
    GetRelativeImageTimes(first, last, arr, size)

### Prototype
```c
unsigned int WINAPI GetRelativeImageTimes(unsigned int first, unsigned int last, at_u64 * arr, unsigned int size);
```
"""
function GetRelativeImageTimes(first, last, arr, size)
    @ccall libandor2.GetRelativeImageTimes(first::Cuint, last::Cuint, arr::Ptr{Culonglong}, size::Cuint)::Cuint
end

"""
    GetRingExposureRange(fpMin, fpMax)

### Prototype
```c
unsigned int WINAPI GetRingExposureRange(float * fpMin, float * fpMax);
```
"""
function GetRingExposureRange(fpMin, fpMax)
    @ccall libandor2.GetRingExposureRange(fpMin::Ptr{Cfloat}, fpMax::Ptr{Cfloat})::Cuint
end

"""
    GetSDK3Handle(Handle)

### Prototype
```c
unsigned int WINAPI GetSDK3Handle(int * Handle);
```
"""
function GetSDK3Handle(Handle)
    @ccall libandor2.GetSDK3Handle(Handle::Ptr{Cint})::Cuint
end

"""
    GetSensitivity(channel, horzShift, amplifier, pa, sensitivity)

### Prototype
```c
unsigned int WINAPI GetSensitivity(int channel, int horzShift, int amplifier, int pa, float * sensitivity);
```
"""
function GetSensitivity(channel, horzShift, amplifier, pa, sensitivity)
    @ccall libandor2.GetSensitivity(channel::Cint, horzShift::Cint, amplifier::Cint, pa::Cint, sensitivity::Ptr{Cfloat})::Cuint
end

"""
    GetShutterMinTimes(minclosingtime, minopeningtime)

### Prototype
```c
unsigned int WINAPI GetShutterMinTimes(int * minclosingtime, int * minopeningtime);
```
"""
function GetShutterMinTimes(minclosingtime, minopeningtime)
    @ccall libandor2.GetShutterMinTimes(minclosingtime::Ptr{Cint}, minopeningtime::Ptr{Cint})::Cuint
end

"""
    GetSizeOfCircularBuffer(index)

### Prototype
```c
unsigned int WINAPI GetSizeOfCircularBuffer(long * index);
```
"""
function GetSizeOfCircularBuffer(index)
    @ccall libandor2.GetSizeOfCircularBuffer(index::Ptr{Clong})::Cuint
end

"""
    GetSlotBusDeviceFunction(dwslot, dwBus, dwDevice, dwFunction)

### Prototype
```c
unsigned int WINAPI GetSlotBusDeviceFunction(DWORD * dwslot, DWORD * dwBus, DWORD * dwDevice, DWORD * dwFunction);
```
"""
function GetSlotBusDeviceFunction(dwslot, dwBus, dwDevice, dwFunction)
    @ccall libandor2.GetSlotBusDeviceFunction(dwslot::Ptr{DWORD}, dwBus::Ptr{DWORD}, dwDevice::Ptr{DWORD}, dwFunction::Ptr{DWORD})::Cuint
end

"""
    GetSoftwareVersion(eprom, coffile, vxdrev, vxdver, dllrev, dllver)

### Prototype
```c
unsigned int WINAPI GetSoftwareVersion(unsigned int * eprom, unsigned int * coffile, unsigned int * vxdrev, unsigned int * vxdver, unsigned int * dllrev, unsigned int * dllver);
```
"""
function GetSoftwareVersion(eprom, coffile, vxdrev, vxdver, dllrev, dllver)
    @ccall libandor2.GetSoftwareVersion(eprom::Ptr{Cuint}, coffile::Ptr{Cuint}, vxdrev::Ptr{Cuint}, vxdver::Ptr{Cuint}, dllrev::Ptr{Cuint}, dllver::Ptr{Cuint})::Cuint
end

"""
    GetSpoolProgress(index)

### Prototype
```c
unsigned int WINAPI GetSpoolProgress(long * index);
```
"""
function GetSpoolProgress(index)
    @ccall libandor2.GetSpoolProgress(index::Ptr{Clong})::Cuint
end

"""
    GetStartUpTime(time)

### Prototype
```c
unsigned int WINAPI GetStartUpTime(float * time);
```
"""
function GetStartUpTime(time)
    @ccall libandor2.GetStartUpTime(time::Ptr{Cfloat})::Cuint
end

"""
    GetStatus(status)

### Prototype
```c
unsigned int WINAPI GetStatus(int * status);
```
"""
function GetStatus(status)
    @ccall libandor2.GetStatus(status::Ptr{Cint})::Cuint
end

"""
    GetTECStatus(piFlag)

### Prototype
```c
unsigned int WINAPI GetTECStatus(int * piFlag);
```
"""
function GetTECStatus(piFlag)
    @ccall libandor2.GetTECStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetTemperature(temperature)

### Prototype
```c
unsigned int WINAPI GetTemperature(int * temperature);
```
"""
function GetTemperature(temperature)
    @ccall libandor2.GetTemperature(temperature::Ptr{Cint})::Cuint
end

"""
    GetTemperatureF(temperature)

### Prototype
```c
unsigned int WINAPI GetTemperatureF(float * temperature);
```
"""
function GetTemperatureF(temperature)
    @ccall libandor2.GetTemperatureF(temperature::Ptr{Cfloat})::Cuint
end

"""
    GetTemperatureRange(mintemp, maxtemp)

### Prototype
```c
unsigned int WINAPI GetTemperatureRange(int * mintemp, int * maxtemp);
```
"""
function GetTemperatureRange(mintemp, maxtemp)
    @ccall libandor2.GetTemperatureRange(mintemp::Ptr{Cint}, maxtemp::Ptr{Cint})::Cuint
end

"""
    GetTemperaturePrecision(precision)

### Prototype
```c
unsigned int WINAPI GetTemperaturePrecision(int * precision);
```
"""
function GetTemperaturePrecision(precision)
    @ccall libandor2.GetTemperaturePrecision(precision::Ptr{Cint})::Cuint
end

"""
    GetTemperatureStatus(SensorTemp, TargetTemp, AmbientTemp, CoolerVolts)

### Prototype
```c
unsigned int WINAPI GetTemperatureStatus(float * SensorTemp, float * TargetTemp, float * AmbientTemp, float * CoolerVolts);
```
"""
function GetTemperatureStatus(SensorTemp, TargetTemp, AmbientTemp, CoolerVolts)
    @ccall libandor2.GetTemperatureStatus(SensorTemp::Ptr{Cfloat}, TargetTemp::Ptr{Cfloat}, AmbientTemp::Ptr{Cfloat}, CoolerVolts::Ptr{Cfloat})::Cuint
end

"""
    GetTotalNumberImagesAcquired(index)

### Prototype
```c
unsigned int WINAPI GetTotalNumberImagesAcquired(long * index);
```
"""
function GetTotalNumberImagesAcquired(index)
    @ccall libandor2.GetTotalNumberImagesAcquired(index::Ptr{Clong})::Cuint
end

"""
    GetIODirection(index, iDirection)

### Prototype
```c
unsigned int WINAPI GetIODirection(int index, int * iDirection);
```
"""
function GetIODirection(index, iDirection)
    @ccall libandor2.GetIODirection(index::Cint, iDirection::Ptr{Cint})::Cuint
end

"""
    GetIOLevel(index, iLevel)

### Prototype
```c
unsigned int WINAPI GetIOLevel(int index, int * iLevel);
```
"""
function GetIOLevel(index, iLevel)
    @ccall libandor2.GetIOLevel(index::Cint, iLevel::Ptr{Cint})::Cuint
end

"""
    GetUSBDeviceDetails(VendorID, ProductID, FirmwareVersion, SpecificationNumber)

### Prototype
```c
unsigned int WINAPI GetUSBDeviceDetails(WORD * VendorID, WORD * ProductID, WORD * FirmwareVersion, WORD * SpecificationNumber);
```
"""
function GetUSBDeviceDetails(VendorID, ProductID, FirmwareVersion, SpecificationNumber)
    @ccall libandor2.GetUSBDeviceDetails(VendorID::Ptr{WORD}, ProductID::Ptr{WORD}, FirmwareVersion::Ptr{WORD}, SpecificationNumber::Ptr{WORD})::Cuint
end

"""
    GetVersionInfo(arr, szVersionInfo, ui32BufferLen)

### Prototype
```c
unsigned int WINAPI GetVersionInfo(AT_VersionInfoId arr, char * szVersionInfo, at_u32 ui32BufferLen);
```
"""
function GetVersionInfo(arr, szVersionInfo, ui32BufferLen)
    @ccall libandor2.GetVersionInfo(arr::AT_VersionInfoId, szVersionInfo::Cstring, ui32BufferLen::Culong)::Cuint
end

"""
    GetVerticalSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetVerticalSpeed(int index, int * speed);
```
"""
function GetVerticalSpeed(index, speed)
    @ccall libandor2.GetVerticalSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetVirtualDMAAddress(Address1, Address2)

### Prototype
```c
unsigned int WINAPI GetVirtualDMAAddress(void ** Address1, void ** Address2);
```
"""
function GetVirtualDMAAddress(Address1, Address2)
    @ccall libandor2.GetVirtualDMAAddress(Address1::Ptr{Ptr{Cvoid}}, Address2::Ptr{Ptr{Cvoid}})::Cuint
end

"""
    GetVSAmplitudeString(index, text)

### Prototype
```c
unsigned int WINAPI GetVSAmplitudeString(int index, char * text);
```
"""
function GetVSAmplitudeString(index, text)
    @ccall libandor2.GetVSAmplitudeString(index::Cint, text::Cstring)::Cuint
end

"""
    GetVSAmplitudeFromString(text, index)

### Prototype
```c
unsigned int WINAPI GetVSAmplitudeFromString(char * text, int * index);
```
"""
function GetVSAmplitudeFromString(text, index)
    @ccall libandor2.GetVSAmplitudeFromString(text::Cstring, index::Ptr{Cint})::Cuint
end

"""
    GetVSAmplitudeValue(index, value)

### Prototype
```c
unsigned int WINAPI GetVSAmplitudeValue(int index, int * value);
```
"""
function GetVSAmplitudeValue(index, value)
    @ccall libandor2.GetVSAmplitudeValue(index::Cint, value::Ptr{Cint})::Cuint
end

"""
    GetVSSpeed(index, speed)

### Prototype
```c
unsigned int WINAPI GetVSSpeed(int index, float * speed);
```
"""
function GetVSSpeed(index, speed)
    @ccall libandor2.GetVSSpeed(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GPIBReceive(id, address, text, size)

### Prototype
```c
unsigned int WINAPI GPIBReceive(int id, short address, char * text, int size);
```
"""
function GPIBReceive(id, address, text, size)
    @ccall libandor2.GPIBReceive(id::Cint, address::Cshort, text::Cstring, size::Cint)::Cuint
end

"""
    GPIBSend(id, address, text)

### Prototype
```c
unsigned int WINAPI GPIBSend(int id, short address, char * text);
```
"""
function GPIBSend(id, address, text)
    @ccall libandor2.GPIBSend(id::Cint, address::Cshort, text::Cstring)::Cuint
end

"""
    I2CBurstRead(i2cAddress, nBytes, data)

### Prototype
```c
unsigned int WINAPI I2CBurstRead(BYTE i2cAddress, long nBytes, BYTE * data);
```
"""
function I2CBurstRead(i2cAddress, nBytes, data)
    @ccall libandor2.I2CBurstRead(i2cAddress::BYTE, nBytes::Clong, data::Ptr{BYTE})::Cuint
end

"""
    I2CBurstWrite(i2cAddress, nBytes, data)

### Prototype
```c
unsigned int WINAPI I2CBurstWrite(BYTE i2cAddress, long nBytes, BYTE * data);
```
"""
function I2CBurstWrite(i2cAddress, nBytes, data)
    @ccall libandor2.I2CBurstWrite(i2cAddress::BYTE, nBytes::Clong, data::Ptr{BYTE})::Cuint
end

"""
    I2CRead(deviceID, intAddress, pdata)

### Prototype
```c
unsigned int WINAPI I2CRead(BYTE deviceID, BYTE intAddress, BYTE * pdata);
```
"""
function I2CRead(deviceID, intAddress, pdata)
    @ccall libandor2.I2CRead(deviceID::BYTE, intAddress::BYTE, pdata::Ptr{BYTE})::Cuint
end

"""
    I2CReset()

### Prototype
```c
unsigned int WINAPI I2CReset(void);
```
"""
function I2CReset()
    @ccall libandor2.I2CReset()::Cuint
end

"""
    I2CWrite(deviceID, intAddress, data)

### Prototype
```c
unsigned int WINAPI I2CWrite(BYTE deviceID, BYTE intAddress, BYTE data);
```
"""
function I2CWrite(deviceID, intAddress, data)
    @ccall libandor2.I2CWrite(deviceID::BYTE, intAddress::BYTE, data::BYTE)::Cuint
end

"""
    IdAndorDll()

### Prototype
```c
unsigned int WINAPI IdAndorDll(void);
```
"""
function IdAndorDll()
    @ccall libandor2.IdAndorDll()::Cuint
end

"""
    InAuxPort(port, state)

### Prototype
```c
unsigned int WINAPI InAuxPort(int port, int * state);
```
"""
function InAuxPort(port, state)
    @ccall libandor2.InAuxPort(port::Cint, state::Ptr{Cint})::Cuint
end

"""
    Initialize(dir)

### Prototype
```c
unsigned int WINAPI Initialize(char * dir);
```
"""
function Initialize(dir)
    @ccall libandor2.Initialize(dir::Cstring)::Cuint
end

"""
    InitializeDevice(dir)

### Prototype
```c
unsigned int WINAPI InitializeDevice(char * dir);
```
"""
function InitializeDevice(dir)
    @ccall libandor2.InitializeDevice(dir::Cstring)::Cuint
end

"""
    IsAmplifierAvailable(iamp)

### Prototype
```c
unsigned int WINAPI IsAmplifierAvailable(int iamp);
```
"""
function IsAmplifierAvailable(iamp)
    @ccall libandor2.IsAmplifierAvailable(iamp::Cint)::Cuint
end

"""
    IsCoolerOn(iCoolerStatus)

### Prototype
```c
unsigned int WINAPI IsCoolerOn(int * iCoolerStatus);
```
"""
function IsCoolerOn(iCoolerStatus)
    @ccall libandor2.IsCoolerOn(iCoolerStatus::Ptr{Cint})::Cuint
end

"""
    IsCountConvertModeAvailable(mode)

### Prototype
```c
unsigned int WINAPI IsCountConvertModeAvailable(int mode);
```
"""
function IsCountConvertModeAvailable(mode)
    @ccall libandor2.IsCountConvertModeAvailable(mode::Cint)::Cuint
end

"""
    IsInternalMechanicalShutter(InternalShutter)

### Prototype
```c
unsigned int WINAPI IsInternalMechanicalShutter(int * InternalShutter);
```
"""
function IsInternalMechanicalShutter(InternalShutter)
    @ccall libandor2.IsInternalMechanicalShutter(InternalShutter::Ptr{Cint})::Cuint
end

"""
    IsPreAmpGainAvailable(channel, amplifier, index, pa, status)

### Prototype
```c
unsigned int WINAPI IsPreAmpGainAvailable(int channel, int amplifier, int index, int pa, int * status);
```
"""
function IsPreAmpGainAvailable(channel, amplifier, index, pa, status)
    @ccall libandor2.IsPreAmpGainAvailable(channel::Cint, amplifier::Cint, index::Cint, pa::Cint, status::Ptr{Cint})::Cuint
end

"""
    IsReadoutFlippedByAmplifier(iAmplifier, iFlipped)

### Prototype
```c
unsigned int WINAPI IsReadoutFlippedByAmplifier(int iAmplifier, int * iFlipped);
```
"""
function IsReadoutFlippedByAmplifier(iAmplifier, iFlipped)
    @ccall libandor2.IsReadoutFlippedByAmplifier(iAmplifier::Cint, iFlipped::Ptr{Cint})::Cuint
end

"""
    IsTriggerModeAvailable(iTriggerMode)

### Prototype
```c
unsigned int WINAPI IsTriggerModeAvailable(int iTriggerMode);
```
"""
function IsTriggerModeAvailable(iTriggerMode)
    @ccall libandor2.IsTriggerModeAvailable(iTriggerMode::Cint)::Cuint
end

"""
    Merge(arr, nOrder, nPoint, nPixel, coeff, fit, hbin, output, start, step_Renamed)

### Prototype
```c
unsigned int WINAPI Merge(const at_32 * arr, long nOrder, long nPoint, long nPixel, float * coeff, long fit, long hbin, at_32 * output, float * start, float * step_Renamed);
```
"""
function Merge(arr, nOrder, nPoint, nPixel, coeff, fit, hbin, output, start, step_Renamed)
    @ccall libandor2.Merge(arr::Ptr{Clong}, nOrder::Clong, nPoint::Clong, nPixel::Clong, coeff::Ptr{Cfloat}, fit::Clong, hbin::Clong, output::Ptr{Clong}, start::Ptr{Cfloat}, step_Renamed::Ptr{Cfloat})::Cuint
end

"""
    OutAuxPort(port, state)

### Prototype
```c
unsigned int WINAPI OutAuxPort(int port, int state);
```
"""
function OutAuxPort(port, state)
    @ccall libandor2.OutAuxPort(port::Cint, state::Cint)::Cuint
end

"""
    PrepareAcquisition()

### Prototype
```c
unsigned int WINAPI PrepareAcquisition(void);
```
"""
function PrepareAcquisition()
    @ccall libandor2.PrepareAcquisition()::Cuint
end

"""
    SaveAsBmp(path, palette, ymin, ymax)

### Prototype
```c
unsigned int WINAPI SaveAsBmp(const char * path, const char * palette, long ymin, long ymax);
```
"""
function SaveAsBmp(path, palette, ymin, ymax)
    @ccall libandor2.SaveAsBmp(path::Cstring, palette::Cstring, ymin::Clong, ymax::Clong)::Cuint
end

"""
    SaveAsCommentedSif(path, comment)

### Prototype
```c
unsigned int WINAPI SaveAsCommentedSif(char * path, char * comment);
```
"""
function SaveAsCommentedSif(path, comment)
    @ccall libandor2.SaveAsCommentedSif(path::Cstring, comment::Cstring)::Cuint
end

"""
    SaveAsEDF(szPath, iMode)

### Prototype
```c
unsigned int WINAPI SaveAsEDF(char * szPath, int iMode);
```
"""
function SaveAsEDF(szPath, iMode)
    @ccall libandor2.SaveAsEDF(szPath::Cstring, iMode::Cint)::Cuint
end

"""
    SaveAsFITS(szFileTitle, typ)

### Prototype
```c
unsigned int WINAPI SaveAsFITS(char * szFileTitle, int typ);
```
"""
function SaveAsFITS(szFileTitle, typ)
    @ccall libandor2.SaveAsFITS(szFileTitle::Cstring, typ::Cint)::Cuint
end

"""
    SaveAsRaw(szFileTitle, typ)

### Prototype
```c
unsigned int WINAPI SaveAsRaw(char * szFileTitle, int typ);
```
"""
function SaveAsRaw(szFileTitle, typ)
    @ccall libandor2.SaveAsRaw(szFileTitle::Cstring, typ::Cint)::Cuint
end

"""
    SaveAsSif(path)

### Prototype
```c
unsigned int WINAPI SaveAsSif(char * path);
```
"""
function SaveAsSif(path)
    @ccall libandor2.SaveAsSif(path::Cstring)::Cuint
end

"""
    SaveAsSPC(path)

### Prototype
```c
unsigned int WINAPI SaveAsSPC(char * path);
```
"""
function SaveAsSPC(path)
    @ccall libandor2.SaveAsSPC(path::Cstring)::Cuint
end

"""
    SaveAsTiff(path, palette, position, typ)

### Prototype
```c
unsigned int WINAPI SaveAsTiff(char * path, char * palette, int position, int typ);
```
"""
function SaveAsTiff(path, palette, position, typ)
    @ccall libandor2.SaveAsTiff(path::Cstring, palette::Cstring, position::Cint, typ::Cint)::Cuint
end

"""
    SaveAsTiffEx(path, palette, position, typ, mode)

### Prototype
```c
unsigned int WINAPI SaveAsTiffEx(char * path, char * palette, int position, int typ, int mode);
```
"""
function SaveAsTiffEx(path, palette, position, typ, mode)
    @ccall libandor2.SaveAsTiffEx(path::Cstring, palette::Cstring, position::Cint, typ::Cint, mode::Cint)::Cuint
end

"""
    SaveEEPROMToFile(cFileName)

### Prototype
```c
unsigned int WINAPI SaveEEPROMToFile(char * cFileName);
```
"""
function SaveEEPROMToFile(cFileName)
    @ccall libandor2.SaveEEPROMToFile(cFileName::Cstring)::Cuint
end

"""
    SaveToClipBoard(palette)

### Prototype
```c
unsigned int WINAPI SaveToClipBoard(char * palette);
```
"""
function SaveToClipBoard(palette)
    @ccall libandor2.SaveToClipBoard(palette::Cstring)::Cuint
end

"""
    SelectDevice(devNum)

### Prototype
```c
unsigned int WINAPI SelectDevice(int devNum);
```
"""
function SelectDevice(devNum)
    @ccall libandor2.SelectDevice(devNum::Cint)::Cuint
end

"""
    SendSoftwareTrigger()

### Prototype
```c
unsigned int WINAPI SendSoftwareTrigger(void);
```
"""
function SendSoftwareTrigger()
    @ccall libandor2.SendSoftwareTrigger()::Cuint
end

"""
    SetAccumulationCycleTime(time)

### Prototype
```c
unsigned int WINAPI SetAccumulationCycleTime(float time);
```
"""
function SetAccumulationCycleTime(time)
    @ccall libandor2.SetAccumulationCycleTime(time::Cfloat)::Cuint
end

"""
    SetAcqStatusEvent(statusEvent)

### Prototype
```c
unsigned int WINAPI SetAcqStatusEvent(HANDLE statusEvent);
```
"""
function SetAcqStatusEvent(statusEvent)
    @ccall libandor2.SetAcqStatusEvent(statusEvent::HANDLE)::Cuint
end

"""
    SetAcquisitionMode(mode)

### Prototype
```c
unsigned int WINAPI SetAcquisitionMode(int mode);
```
"""
function SetAcquisitionMode(mode)
    @ccall libandor2.SetAcquisitionMode(mode::Cint)::Cuint
end

"""
    SetSensorPortMode(mode)

### Prototype
```c
unsigned int WINAPI SetSensorPortMode(int mode);
```
"""
function SetSensorPortMode(mode)
    @ccall libandor2.SetSensorPortMode(mode::Cint)::Cuint
end

"""
    SelectSensorPort(port)

### Prototype
```c
unsigned int WINAPI SelectSensorPort(int port);
```
"""
function SelectSensorPort(port)
    @ccall libandor2.SelectSensorPort(port::Cint)::Cuint
end

"""
    SetAcquisitionType(typ)

### Prototype
```c
unsigned int WINAPI SetAcquisitionType(int typ);
```
"""
function SetAcquisitionType(typ)
    @ccall libandor2.SetAcquisitionType(typ::Cint)::Cuint
end

"""
    SetADChannel(channel)

### Prototype
```c
unsigned int WINAPI SetADChannel(int channel);
```
"""
function SetADChannel(channel)
    @ccall libandor2.SetADChannel(channel::Cint)::Cuint
end

"""
    SetAdvancedTriggerModeState(iState)

### Prototype
```c
unsigned int WINAPI SetAdvancedTriggerModeState(int iState);
```
"""
function SetAdvancedTriggerModeState(iState)
    @ccall libandor2.SetAdvancedTriggerModeState(iState::Cint)::Cuint
end

"""
    SetBackground(arr, size)

### Prototype
```c
unsigned int WINAPI SetBackground(at_32 * arr, unsigned long size);
```
"""
function SetBackground(arr, size)
    @ccall libandor2.SetBackground(arr::Ptr{Clong}, size::Culong)::Cuint
end

"""
    SetBaselineClamp(state)

### Prototype
```c
unsigned int WINAPI SetBaselineClamp(int state);
```
"""
function SetBaselineClamp(state)
    @ccall libandor2.SetBaselineClamp(state::Cint)::Cuint
end

"""
    SetBaselineOffset(offset)

### Prototype
```c
unsigned int WINAPI SetBaselineOffset(int offset);
```
"""
function SetBaselineOffset(offset)
    @ccall libandor2.SetBaselineOffset(offset::Cint)::Cuint
end

"""
    SetCameraLinkMode(mode)

### Prototype
```c
unsigned int WINAPI SetCameraLinkMode(int mode);
```
"""
function SetCameraLinkMode(mode)
    @ccall libandor2.SetCameraLinkMode(mode::Cint)::Cuint
end

"""
    SetCameraStatusEnable(Enable)

### Prototype
```c
unsigned int WINAPI SetCameraStatusEnable(DWORD Enable);
```
"""
function SetCameraStatusEnable(Enable)
    @ccall libandor2.SetCameraStatusEnable(Enable::DWORD)::Cuint
end

"""
    SetChargeShifting(NumberRows, NumberRepeats)

### Prototype
```c
unsigned int WINAPI SetChargeShifting(unsigned int NumberRows, unsigned int NumberRepeats);
```
"""
function SetChargeShifting(NumberRows, NumberRepeats)
    @ccall libandor2.SetChargeShifting(NumberRows::Cuint, NumberRepeats::Cuint)::Cuint
end

"""
    SetComplexImage(numAreas, areas)

### Prototype
```c
unsigned int WINAPI SetComplexImage(int numAreas, int * areas);
```
"""
function SetComplexImage(numAreas, areas)
    @ccall libandor2.SetComplexImage(numAreas::Cint, areas::Ptr{Cint})::Cuint
end

"""
    SetCoolerMode(mode)

### Prototype
```c
unsigned int WINAPI SetCoolerMode(int mode);
```
"""
function SetCoolerMode(mode)
    @ccall libandor2.SetCoolerMode(mode::Cint)::Cuint
end

"""
    SetCountConvertMode(Mode)

### Prototype
```c
unsigned int WINAPI SetCountConvertMode(int Mode);
```
"""
function SetCountConvertMode(Mode)
    @ccall libandor2.SetCountConvertMode(Mode::Cint)::Cuint
end

"""
    SetCountConvertWavelength(wavelength)

### Prototype
```c
unsigned int WINAPI SetCountConvertWavelength(float wavelength);
```
"""
function SetCountConvertWavelength(wavelength)
    @ccall libandor2.SetCountConvertWavelength(wavelength::Cfloat)::Cuint
end

"""
    SetCropMode(active, cropHeight, reserved)

### Prototype
```c
unsigned int WINAPI SetCropMode(int active, int cropHeight, int reserved);
```
"""
function SetCropMode(active, cropHeight, reserved)
    @ccall libandor2.SetCropMode(active::Cint, cropHeight::Cint, reserved::Cint)::Cuint
end

"""
    SetCurrentCamera(cameraHandle)

### Prototype
```c
unsigned int WINAPI SetCurrentCamera(long cameraHandle);
```
"""
function SetCurrentCamera(cameraHandle)
    @ccall libandor2.SetCurrentCamera(cameraHandle::Clong)::Cuint
end

"""
    SetCustomTrackHBin(bin)

### Prototype
```c
unsigned int WINAPI SetCustomTrackHBin(int bin);
```
"""
function SetCustomTrackHBin(bin)
    @ccall libandor2.SetCustomTrackHBin(bin::Cint)::Cuint
end

"""
    SetDataType(typ)

### Prototype
```c
unsigned int WINAPI SetDataType(int typ);
```
"""
function SetDataType(typ)
    @ccall libandor2.SetDataType(typ::Cint)::Cuint
end

"""
    SetDACOutput(iOption, iResolution, iValue)

### Prototype
```c
unsigned int WINAPI SetDACOutput(int iOption, int iResolution, int iValue);
```
"""
function SetDACOutput(iOption, iResolution, iValue)
    @ccall libandor2.SetDACOutput(iOption::Cint, iResolution::Cint, iValue::Cint)::Cuint
end

"""
    SetDACOutputScale(iScale)

### Prototype
```c
unsigned int WINAPI SetDACOutputScale(int iScale);
```
"""
function SetDACOutputScale(iScale)
    @ccall libandor2.SetDACOutputScale(iScale::Cint)::Cuint
end

"""
    SetDDGAddress(t0, t1, t2, t3, address)

### Prototype
```c
unsigned int WINAPI SetDDGAddress(BYTE t0, BYTE t1, BYTE t2, BYTE t3, BYTE address);
```
"""
function SetDDGAddress(t0, t1, t2, t3, address)
    @ccall libandor2.SetDDGAddress(t0::BYTE, t1::BYTE, t2::BYTE, t3::BYTE, address::BYTE)::Cuint
end

"""
    SetDDGExternalOutputEnabled(uiIndex, uiEnabled)

### Prototype
```c
unsigned int WINAPI SetDDGExternalOutputEnabled(at_u32 uiIndex, at_u32 uiEnabled);
```
"""
function SetDDGExternalOutputEnabled(uiIndex, uiEnabled)
    @ccall libandor2.SetDDGExternalOutputEnabled(uiIndex::Culong, uiEnabled::Culong)::Cuint
end

"""
    SetDDGExternalOutputPolarity(uiIndex, uiPolarity)

### Prototype
```c
unsigned int WINAPI SetDDGExternalOutputPolarity(at_u32 uiIndex, at_u32 uiPolarity);
```
"""
function SetDDGExternalOutputPolarity(uiIndex, uiPolarity)
    @ccall libandor2.SetDDGExternalOutputPolarity(uiIndex::Culong, uiPolarity::Culong)::Cuint
end

"""
    SetDDGExternalOutputStepEnabled(uiIndex, uiEnabled)

### Prototype
```c
unsigned int WINAPI SetDDGExternalOutputStepEnabled(at_u32 uiIndex, at_u32 uiEnabled);
```
"""
function SetDDGExternalOutputStepEnabled(uiIndex, uiEnabled)
    @ccall libandor2.SetDDGExternalOutputStepEnabled(uiIndex::Culong, uiEnabled::Culong)::Cuint
end

"""
    SetDDGExternalOutputTime(uiIndex, uiDelay, uiWidth)

### Prototype
```c
unsigned int WINAPI SetDDGExternalOutputTime(at_u32 uiIndex, at_u64 uiDelay, at_u64 uiWidth);
```
"""
function SetDDGExternalOutputTime(uiIndex, uiDelay, uiWidth)
    @ccall libandor2.SetDDGExternalOutputTime(uiIndex::Culong, uiDelay::Culonglong, uiWidth::Culonglong)::Cuint
end

"""
    SetDDGGain(gain)

### Prototype
```c
unsigned int WINAPI SetDDGGain(int gain);
```
"""
function SetDDGGain(gain)
    @ccall libandor2.SetDDGGain(gain::Cint)::Cuint
end

"""
    SetDDGGateStep(step_Renamed)

### Prototype
```c
unsigned int WINAPI SetDDGGateStep(double step_Renamed);
```
"""
function SetDDGGateStep(step_Renamed)
    @ccall libandor2.SetDDGGateStep(step_Renamed::Cdouble)::Cuint
end

"""
    SetDDGGateTime(uiDelay, uiWidth)

### Prototype
```c
unsigned int WINAPI SetDDGGateTime(at_u64 uiDelay, at_u64 uiWidth);
```
"""
function SetDDGGateTime(uiDelay, uiWidth)
    @ccall libandor2.SetDDGGateTime(uiDelay::Culonglong, uiWidth::Culonglong)::Cuint
end

"""
    SetDDGInsertionDelay(state)

### Prototype
```c
unsigned int WINAPI SetDDGInsertionDelay(int state);
```
"""
function SetDDGInsertionDelay(state)
    @ccall libandor2.SetDDGInsertionDelay(state::Cint)::Cuint
end

"""
    SetDDGIntelligate(state)

### Prototype
```c
unsigned int WINAPI SetDDGIntelligate(int state);
```
"""
function SetDDGIntelligate(state)
    @ccall libandor2.SetDDGIntelligate(state::Cint)::Cuint
end

"""
    SetDDGIOC(state)

### Prototype
```c
unsigned int WINAPI SetDDGIOC(int state);
```
"""
function SetDDGIOC(state)
    @ccall libandor2.SetDDGIOC(state::Cint)::Cuint
end

"""
    SetDDGIOCFrequency(frequency)

### Prototype
```c
unsigned int WINAPI SetDDGIOCFrequency(double frequency);
```
"""
function SetDDGIOCFrequency(frequency)
    @ccall libandor2.SetDDGIOCFrequency(frequency::Cdouble)::Cuint
end

"""
    SetDDGIOCNumber(numberPulses)

### Prototype
```c
unsigned int WINAPI SetDDGIOCNumber(unsigned long numberPulses);
```
"""
function SetDDGIOCNumber(numberPulses)
    @ccall libandor2.SetDDGIOCNumber(numberPulses::Culong)::Cuint
end

"""
    SetDDGIOCPeriod(period)

### Prototype
```c
unsigned int WINAPI SetDDGIOCPeriod(at_u64 period);
```
"""
function SetDDGIOCPeriod(period)
    @ccall libandor2.SetDDGIOCPeriod(period::Culonglong)::Cuint
end

"""
    SetDDGIOCTrigger(trigger)

### Prototype
```c
unsigned int WINAPI SetDDGIOCTrigger(at_u32 trigger);
```
"""
function SetDDGIOCTrigger(trigger)
    @ccall libandor2.SetDDGIOCTrigger(trigger::Culong)::Cuint
end

"""
    SetDDGOpticalWidthEnabled(uiEnabled)

### Prototype
```c
unsigned int WINAPI SetDDGOpticalWidthEnabled(at_u32 uiEnabled);
```
"""
function SetDDGOpticalWidthEnabled(uiEnabled)
    @ccall libandor2.SetDDGOpticalWidthEnabled(uiEnabled::Culong)::Cuint
end

"""
    SetDDGLiteGlobalControlByte(control)

### Prototype
```c
unsigned int WINAPI SetDDGLiteGlobalControlByte(unsigned char control);
```
"""
function SetDDGLiteGlobalControlByte(control)
    @ccall libandor2.SetDDGLiteGlobalControlByte(control::Cuchar)::Cuint
end

"""
    SetDDGLiteControlByte(channel, control)

### Prototype
```c
unsigned int WINAPI SetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char control);
```
"""
function SetDDGLiteControlByte(channel, control)
    @ccall libandor2.SetDDGLiteControlByte(channel::AT_DDGLiteChannelId, control::Cuchar)::Cuint
end

"""
    SetDDGLiteInitialDelay(channel, fDelay)

### Prototype
```c
unsigned int WINAPI SetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float fDelay);
```
"""
function SetDDGLiteInitialDelay(channel, fDelay)
    @ccall libandor2.SetDDGLiteInitialDelay(channel::AT_DDGLiteChannelId, fDelay::Cfloat)::Cuint
end

"""
    SetDDGLitePulseWidth(channel, fWidth)

### Prototype
```c
unsigned int WINAPI SetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float fWidth);
```
"""
function SetDDGLitePulseWidth(channel, fWidth)
    @ccall libandor2.SetDDGLitePulseWidth(channel::AT_DDGLiteChannelId, fWidth::Cfloat)::Cuint
end

"""
    SetDDGLiteInterPulseDelay(channel, fDelay)

### Prototype
```c
unsigned int WINAPI SetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float fDelay);
```
"""
function SetDDGLiteInterPulseDelay(channel, fDelay)
    @ccall libandor2.SetDDGLiteInterPulseDelay(channel::AT_DDGLiteChannelId, fDelay::Cfloat)::Cuint
end

"""
    SetDDGLitePulsesPerExposure(channel, ui32Pulses)

### Prototype
```c
unsigned int WINAPI SetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, at_u32 ui32Pulses);
```
"""
function SetDDGLitePulsesPerExposure(channel, ui32Pulses)
    @ccall libandor2.SetDDGLitePulsesPerExposure(channel::AT_DDGLiteChannelId, ui32Pulses::Culong)::Cuint
end

"""
    SetDDGStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int WINAPI SetDDGStepCoefficients(at_u32 mode, double p1, double p2);
```
"""
function SetDDGStepCoefficients(mode, p1, p2)
    @ccall libandor2.SetDDGStepCoefficients(mode::Culong, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDDGWidthStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int WINAPI SetDDGWidthStepCoefficients(at_u32 mode, double p1, double p2);
```
"""
function SetDDGWidthStepCoefficients(mode, p1, p2)
    @ccall libandor2.SetDDGWidthStepCoefficients(mode::Culong, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDDGStepMode(mode)

### Prototype
```c
unsigned int WINAPI SetDDGStepMode(at_u32 mode);
```
"""
function SetDDGStepMode(mode)
    @ccall libandor2.SetDDGStepMode(mode::Culong)::Cuint
end

"""
    SetDDGWidthStepMode(mode)

### Prototype
```c
unsigned int WINAPI SetDDGWidthStepMode(at_u32 mode);
```
"""
function SetDDGWidthStepMode(mode)
    @ccall libandor2.SetDDGWidthStepMode(mode::Culong)::Cuint
end

"""
    SetDDGTimes(t0, t1, t2)

### Prototype
```c
unsigned int WINAPI SetDDGTimes(double t0, double t1, double t2);
```
"""
function SetDDGTimes(t0, t1, t2)
    @ccall libandor2.SetDDGTimes(t0::Cdouble, t1::Cdouble, t2::Cdouble)::Cuint
end

"""
    SetDDGTriggerMode(mode)

### Prototype
```c
unsigned int WINAPI SetDDGTriggerMode(int mode);
```
"""
function SetDDGTriggerMode(mode)
    @ccall libandor2.SetDDGTriggerMode(mode::Cint)::Cuint
end

"""
    SetDDGVariableGateStep(mode, p1, p2)

### Prototype
```c
unsigned int WINAPI SetDDGVariableGateStep(int mode, double p1, double p2);
```
"""
function SetDDGVariableGateStep(mode, p1, p2)
    @ccall libandor2.SetDDGVariableGateStep(mode::Cint, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDelayGenerator(board, address, typ)

### Prototype
```c
unsigned int WINAPI SetDelayGenerator(int board, short address, int typ);
```
"""
function SetDelayGenerator(board, address, typ)
    @ccall libandor2.SetDelayGenerator(board::Cint, address::Cshort, typ::Cint)::Cuint
end

"""
    SetDMAParameters(MaxImagesPerDMA, SecondsPerDMA)

### Prototype
```c
unsigned int WINAPI SetDMAParameters(int MaxImagesPerDMA, float SecondsPerDMA);
```
"""
function SetDMAParameters(MaxImagesPerDMA, SecondsPerDMA)
    @ccall libandor2.SetDMAParameters(MaxImagesPerDMA::Cint, SecondsPerDMA::Cfloat)::Cuint
end

"""
    SetDriverEvent(driverEvent)

### Prototype
```c
unsigned int WINAPI SetDriverEvent(HANDLE driverEvent);
```
"""
function SetDriverEvent(driverEvent)
    @ccall libandor2.SetDriverEvent(driverEvent::HANDLE)::Cuint
end

"""
    SetEMAdvanced(state)

### Prototype
```c
unsigned int WINAPI SetEMAdvanced(int state);
```
"""
function SetEMAdvanced(state)
    @ccall libandor2.SetEMAdvanced(state::Cint)::Cuint
end

"""
    SetEMCCDGain(gain)

### Prototype
```c
unsigned int WINAPI SetEMCCDGain(int gain);
```
"""
function SetEMCCDGain(gain)
    @ccall libandor2.SetEMCCDGain(gain::Cint)::Cuint
end

"""
    SetEMClockCompensation(EMClockCompensationFlag)

### Prototype
```c
unsigned int WINAPI SetEMClockCompensation(int EMClockCompensationFlag);
```
"""
function SetEMClockCompensation(EMClockCompensationFlag)
    @ccall libandor2.SetEMClockCompensation(EMClockCompensationFlag::Cint)::Cuint
end

"""
    SetEMGainMode(mode)

### Prototype
```c
unsigned int WINAPI SetEMGainMode(int mode);
```
"""
function SetEMGainMode(mode)
    @ccall libandor2.SetEMGainMode(mode::Cint)::Cuint
end

"""
    SetExposureTime(time)

### Prototype
```c
unsigned int WINAPI SetExposureTime(float time);
```
"""
function SetExposureTime(time)
    @ccall libandor2.SetExposureTime(time::Cfloat)::Cuint
end

"""
    SetExternalTriggerTermination(uiTermination)

### Prototype
```c
unsigned int WINAPI SetExternalTriggerTermination(at_u32 uiTermination);
```
"""
function SetExternalTriggerTermination(uiTermination)
    @ccall libandor2.SetExternalTriggerTermination(uiTermination::Culong)::Cuint
end

"""
    SetFanMode(mode)

### Prototype
```c
unsigned int WINAPI SetFanMode(int mode);
```
"""
function SetFanMode(mode)
    @ccall libandor2.SetFanMode(mode::Cint)::Cuint
end

"""
    SetFastExtTrigger(mode)

### Prototype
```c
unsigned int WINAPI SetFastExtTrigger(int mode);
```
"""
function SetFastExtTrigger(mode)
    @ccall libandor2.SetFastExtTrigger(mode::Cint)::Cuint
end

"""
    SetFastKinetics(exposedRows, seriesLength, time, mode, hbin, vbin)

### Prototype
```c
unsigned int WINAPI SetFastKinetics(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin);
```
"""
function SetFastKinetics(exposedRows, seriesLength, time, mode, hbin, vbin)
    @ccall libandor2.SetFastKinetics(exposedRows::Cint, seriesLength::Cint, time::Cfloat, mode::Cint, hbin::Cint, vbin::Cint)::Cuint
end

"""
    SetFastKineticsEx(exposedRows, seriesLength, time, mode, hbin, vbin, offset)

### Prototype
```c
unsigned int WINAPI SetFastKineticsEx(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin, int offset);
```
"""
function SetFastKineticsEx(exposedRows, seriesLength, time, mode, hbin, vbin, offset)
    @ccall libandor2.SetFastKineticsEx(exposedRows::Cint, seriesLength::Cint, time::Cfloat, mode::Cint, hbin::Cint, vbin::Cint, offset::Cint)::Cuint
end

"""
    SetSuperKinetics(exposedRows, seriesLength, time, mode, hbin, vbin, offset)

### Prototype
```c
unsigned int WINAPI SetSuperKinetics(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin, int offset);
```
"""
function SetSuperKinetics(exposedRows, seriesLength, time, mode, hbin, vbin, offset)
    @ccall libandor2.SetSuperKinetics(exposedRows::Cint, seriesLength::Cint, time::Cfloat, mode::Cint, hbin::Cint, vbin::Cint, offset::Cint)::Cuint
end

"""
    SetTimeScan(rows, tracks, mode)

### Prototype
```c
unsigned int WINAPI SetTimeScan(int rows, int tracks, int mode);
```
"""
function SetTimeScan(rows, tracks, mode)
    @ccall libandor2.SetTimeScan(rows::Cint, tracks::Cint, mode::Cint)::Cuint
end

"""
    SetFilterMode(mode)

### Prototype
```c
unsigned int WINAPI SetFilterMode(int mode);
```
"""
function SetFilterMode(mode)
    @ccall libandor2.SetFilterMode(mode::Cint)::Cuint
end

"""
    SetFilterParameters(width, sensitivity, range, accept, smooth, noise)

### Prototype
```c
unsigned int WINAPI SetFilterParameters(int width, float sensitivity, int range, float accept, int smooth, int noise);
```
"""
function SetFilterParameters(width, sensitivity, range, accept, smooth, noise)
    @ccall libandor2.SetFilterParameters(width::Cint, sensitivity::Cfloat, range::Cint, accept::Cfloat, smooth::Cint, noise::Cint)::Cuint
end

"""
    SetFKVShiftSpeed(index)

### Prototype
```c
unsigned int WINAPI SetFKVShiftSpeed(int index);
```
"""
function SetFKVShiftSpeed(index)
    @ccall libandor2.SetFKVShiftSpeed(index::Cint)::Cuint
end

"""
    SetFPDP(state)

### Prototype
```c
unsigned int WINAPI SetFPDP(int state);
```
"""
function SetFPDP(state)
    @ccall libandor2.SetFPDP(state::Cint)::Cuint
end

"""
    SetFrameTransferMode(mode)

### Prototype
```c
unsigned int WINAPI SetFrameTransferMode(int mode);
```
"""
function SetFrameTransferMode(mode)
    @ccall libandor2.SetFrameTransferMode(mode::Cint)::Cuint
end

"""
    SetFrontEndEvent(driverEvent)

### Prototype
```c
unsigned int WINAPI SetFrontEndEvent(HANDLE driverEvent);
```
"""
function SetFrontEndEvent(driverEvent)
    @ccall libandor2.SetFrontEndEvent(driverEvent::HANDLE)::Cuint
end

"""
    SetFullImage(hbin, vbin)

### Prototype
```c
unsigned int WINAPI SetFullImage(int hbin, int vbin);
```
"""
function SetFullImage(hbin, vbin)
    @ccall libandor2.SetFullImage(hbin::Cint, vbin::Cint)::Cuint
end

"""
    SetFVBHBin(bin)

### Prototype
```c
unsigned int WINAPI SetFVBHBin(int bin);
```
"""
function SetFVBHBin(bin)
    @ccall libandor2.SetFVBHBin(bin::Cint)::Cuint
end

"""
    SetGain(gain)

### Prototype
```c
unsigned int WINAPI SetGain(int gain);
```
"""
function SetGain(gain)
    @ccall libandor2.SetGain(gain::Cint)::Cuint
end

"""
    SetGate(delay, width, stepRenamed)

### Prototype
```c
unsigned int WINAPI SetGate(float delay, float width, float stepRenamed);
```
"""
function SetGate(delay, width, stepRenamed)
    @ccall libandor2.SetGate(delay::Cfloat, width::Cfloat, stepRenamed::Cfloat)::Cuint
end

"""
    SetGateMode(gatemode)

### Prototype
```c
unsigned int WINAPI SetGateMode(int gatemode);
```
"""
function SetGateMode(gatemode)
    @ccall libandor2.SetGateMode(gatemode::Cint)::Cuint
end

"""
    SetHighCapacity(state)

### Prototype
```c
unsigned int WINAPI SetHighCapacity(int state);
```
"""
function SetHighCapacity(state)
    @ccall libandor2.SetHighCapacity(state::Cint)::Cuint
end

"""
    SetHorizontalSpeed(index)

### Prototype
```c
unsigned int WINAPI SetHorizontalSpeed(int index);
```
"""
function SetHorizontalSpeed(index)
    @ccall libandor2.SetHorizontalSpeed(index::Cint)::Cuint
end

"""
    SetHSSpeed(typ, index)

### Prototype
```c
unsigned int WINAPI SetHSSpeed(int typ, int index);
```
"""
function SetHSSpeed(typ, index)
    @ccall libandor2.SetHSSpeed(typ::Cint, index::Cint)::Cuint
end

"""
    SetImage(hbin, vbin, hstart, hend, vstart, vend)

### Prototype
```c
unsigned int WINAPI SetImage(int hbin, int vbin, int hstart, int hend, int vstart, int vend);
```
"""
function SetImage(hbin, vbin, hstart, hend, vstart, vend)
    @ccall libandor2.SetImage(hbin::Cint, vbin::Cint, hstart::Cint, hend::Cint, vstart::Cint, vend::Cint)::Cuint
end

"""
    SetImageFlip(iHFlip, iVFlip)

### Prototype
```c
unsigned int WINAPI SetImageFlip(int iHFlip, int iVFlip);
```
"""
function SetImageFlip(iHFlip, iVFlip)
    @ccall libandor2.SetImageFlip(iHFlip::Cint, iVFlip::Cint)::Cuint
end

"""
    SetImageRotate(iRotate)

### Prototype
```c
unsigned int WINAPI SetImageRotate(int iRotate);
```
"""
function SetImageRotate(iRotate)
    @ccall libandor2.SetImageRotate(iRotate::Cint)::Cuint
end

"""
    SetIsolatedCropMode(active, cropheight, cropwidth, vbin, hbin)

### Prototype
```c
unsigned int WINAPI SetIsolatedCropMode(int active, int cropheight, int cropwidth, int vbin, int hbin);
```
"""
function SetIsolatedCropMode(active, cropheight, cropwidth, vbin, hbin)
    @ccall libandor2.SetIsolatedCropMode(active::Cint, cropheight::Cint, cropwidth::Cint, vbin::Cint, hbin::Cint)::Cuint
end

"""
    SetIsolatedCropModeEx(active, cropheight, cropwidth, vbin, hbin, cropleft, cropbottom)

### Prototype
```c
unsigned int WINAPI SetIsolatedCropModeEx(int active, int cropheight, int cropwidth, int vbin, int hbin, int cropleft, int cropbottom);
```
"""
function SetIsolatedCropModeEx(active, cropheight, cropwidth, vbin, hbin, cropleft, cropbottom)
    @ccall libandor2.SetIsolatedCropModeEx(active::Cint, cropheight::Cint, cropwidth::Cint, vbin::Cint, hbin::Cint, cropleft::Cint, cropbottom::Cint)::Cuint
end

"""
    SetKineticCycleTime(time)

### Prototype
```c
unsigned int WINAPI SetKineticCycleTime(float time);
```
"""
function SetKineticCycleTime(time)
    @ccall libandor2.SetKineticCycleTime(time::Cfloat)::Cuint
end

"""
    SetMCPGain(gain)

### Prototype
```c
unsigned int WINAPI SetMCPGain(int gain);
```
"""
function SetMCPGain(gain)
    @ccall libandor2.SetMCPGain(gain::Cint)::Cuint
end

"""
    SetMCPGating(gating)

### Prototype
```c
unsigned int WINAPI SetMCPGating(int gating);
```
"""
function SetMCPGating(gating)
    @ccall libandor2.SetMCPGating(gating::Cint)::Cuint
end

"""
    SetMetaData(state)

### Prototype
```c
unsigned int WINAPI SetMetaData(int state);
```
"""
function SetMetaData(state)
    @ccall libandor2.SetMetaData(state::Cint)::Cuint
end

"""
    SetMultiTrack(number, height, offset, bottom, gap)

### Prototype
```c
unsigned int WINAPI SetMultiTrack(int number, int height, int offset, int * bottom, int * gap);
```
"""
function SetMultiTrack(number, height, offset, bottom, gap)
    @ccall libandor2.SetMultiTrack(number::Cint, height::Cint, offset::Cint, bottom::Ptr{Cint}, gap::Ptr{Cint})::Cuint
end

"""
    SetMultiTrackHBin(bin)

### Prototype
```c
unsigned int WINAPI SetMultiTrackHBin(int bin);
```
"""
function SetMultiTrackHBin(bin)
    @ccall libandor2.SetMultiTrackHBin(bin::Cint)::Cuint
end

"""
    SetMultiTrackHRange(iStart, iEnd)

### Prototype
```c
unsigned int WINAPI SetMultiTrackHRange(int iStart, int iEnd);
```
"""
function SetMultiTrackHRange(iStart, iEnd)
    @ccall libandor2.SetMultiTrackHRange(iStart::Cint, iEnd::Cint)::Cuint
end

"""
    SetMultiTrackScan(trackHeight, numberTracks, iSIHStart, iSIHEnd, trackHBinning, trackVBinning, trackGap, trackOffset, trackSkip, numberSubFrames)

### Prototype
```c
unsigned int WINAPI SetMultiTrackScan(int trackHeight, int numberTracks, int iSIHStart, int iSIHEnd, int trackHBinning, int trackVBinning, int trackGap, int trackOffset, int trackSkip, int numberSubFrames);
```
"""
function SetMultiTrackScan(trackHeight, numberTracks, iSIHStart, iSIHEnd, trackHBinning, trackVBinning, trackGap, trackOffset, trackSkip, numberSubFrames)
    @ccall libandor2.SetMultiTrackScan(trackHeight::Cint, numberTracks::Cint, iSIHStart::Cint, iSIHEnd::Cint, trackHBinning::Cint, trackVBinning::Cint, trackGap::Cint, trackOffset::Cint, trackSkip::Cint, numberSubFrames::Cint)::Cuint
end

"""
    SetNextAddress(data, lowAdd, highAdd, length, physical)

### Prototype
```c
unsigned int WINAPI SetNextAddress(at_32 * data, long lowAdd, long highAdd, long length, long physical);
```
"""
function SetNextAddress(data, lowAdd, highAdd, length, physical)
    @ccall libandor2.SetNextAddress(data::Ptr{Clong}, lowAdd::Clong, highAdd::Clong, length::Clong, physical::Clong)::Cuint
end

"""
    SetNextAddress16(data, lowAdd, highAdd, length, physical)

### Prototype
```c
unsigned int WINAPI SetNextAddress16(at_32 * data, long lowAdd, long highAdd, long length, long physical);
```
"""
function SetNextAddress16(data, lowAdd, highAdd, length, physical)
    @ccall libandor2.SetNextAddress16(data::Ptr{Clong}, lowAdd::Clong, highAdd::Clong, length::Clong, physical::Clong)::Cuint
end

"""
    SetNumberAccumulations(number)

### Prototype
```c
unsigned int WINAPI SetNumberAccumulations(int number);
```
"""
function SetNumberAccumulations(number)
    @ccall libandor2.SetNumberAccumulations(number::Cint)::Cuint
end

"""
    SetNumberKinetics(number)

### Prototype
```c
unsigned int WINAPI SetNumberKinetics(int number);
```
"""
function SetNumberKinetics(number)
    @ccall libandor2.SetNumberKinetics(number::Cint)::Cuint
end

"""
    SetNumberPrescans(iNumber)

### Prototype
```c
unsigned int WINAPI SetNumberPrescans(int iNumber);
```
"""
function SetNumberPrescans(iNumber)
    @ccall libandor2.SetNumberPrescans(iNumber::Cint)::Cuint
end

"""
    SetOutputAmplifier(typ)

### Prototype
```c
unsigned int WINAPI SetOutputAmplifier(int typ);
```
"""
function SetOutputAmplifier(typ)
    @ccall libandor2.SetOutputAmplifier(typ::Cint)::Cuint
end

"""
    SetOverlapMode(mode)

### Prototype
```c
unsigned int WINAPI SetOverlapMode(int mode);
```
"""
function SetOverlapMode(mode)
    @ccall libandor2.SetOverlapMode(mode::Cint)::Cuint
end

"""
    SetPCIMode(mode, value)

### Prototype
```c
unsigned int WINAPI SetPCIMode(int mode, int value);
```
"""
function SetPCIMode(mode, value)
    @ccall libandor2.SetPCIMode(mode::Cint, value::Cint)::Cuint
end

"""
    SetPhotonCounting(state)

### Prototype
```c
unsigned int WINAPI SetPhotonCounting(int state);
```
"""
function SetPhotonCounting(state)
    @ccall libandor2.SetPhotonCounting(state::Cint)::Cuint
end

"""
    SetPhotonCountingThreshold(min, max)

### Prototype
```c
unsigned int WINAPI SetPhotonCountingThreshold(long min, long max);
```
"""
function SetPhotonCountingThreshold(min, max)
    @ccall libandor2.SetPhotonCountingThreshold(min::Clong, max::Clong)::Cuint
end

"""
    SetPhosphorEvent(driverEvent)

### Prototype
```c
unsigned int WINAPI SetPhosphorEvent(HANDLE driverEvent);
```
"""
function SetPhosphorEvent(driverEvent)
    @ccall libandor2.SetPhosphorEvent(driverEvent::HANDLE)::Cuint
end

"""
    SetPhotonCountingDivisions(noOfDivisions, divisions)

### Prototype
```c
unsigned int WINAPI SetPhotonCountingDivisions(at_u32 noOfDivisions, at_32 * divisions);
```
"""
function SetPhotonCountingDivisions(noOfDivisions, divisions)
    @ccall libandor2.SetPhotonCountingDivisions(noOfDivisions::Culong, divisions::Ptr{Clong})::Cuint
end

"""
    SetPixelMode(bitdepth, colormode)

### Prototype
```c
unsigned int WINAPI SetPixelMode(int bitdepth, int colormode);
```
"""
function SetPixelMode(bitdepth, colormode)
    @ccall libandor2.SetPixelMode(bitdepth::Cint, colormode::Cint)::Cuint
end

"""
    SetPreAmpGain(index)

### Prototype
```c
unsigned int WINAPI SetPreAmpGain(int index);
```
"""
function SetPreAmpGain(index)
    @ccall libandor2.SetPreAmpGain(index::Cint)::Cuint
end

"""
    SetDualExposureTimes(expTime1, expTime2)

### Prototype
```c
unsigned int WINAPI SetDualExposureTimes(float expTime1, float expTime2);
```
"""
function SetDualExposureTimes(expTime1, expTime2)
    @ccall libandor2.SetDualExposureTimes(expTime1::Cfloat, expTime2::Cfloat)::Cuint
end

"""
    SetDualExposureMode(mode)

### Prototype
```c
unsigned int WINAPI SetDualExposureMode(int mode);
```
"""
function SetDualExposureMode(mode)
    @ccall libandor2.SetDualExposureMode(mode::Cint)::Cuint
end

"""
    SetRandomTracks(numTracks, areas)

### Prototype
```c
unsigned int WINAPI SetRandomTracks(int numTracks, int * areas);
```
"""
function SetRandomTracks(numTracks, areas)
    @ccall libandor2.SetRandomTracks(numTracks::Cint, areas::Ptr{Cint})::Cuint
end

"""
    SetReadMode(mode)

### Prototype
```c
unsigned int WINAPI SetReadMode(int mode);
```
"""
function SetReadMode(mode)
    @ccall libandor2.SetReadMode(mode::Cint)::Cuint
end

"""
    SetReadoutRegisterPacking(mode)

### Prototype
```c
unsigned int WINAPI SetReadoutRegisterPacking(unsigned int mode);
```
"""
function SetReadoutRegisterPacking(mode)
    @ccall libandor2.SetReadoutRegisterPacking(mode::Cuint)::Cuint
end

"""
    SetRegisterDump(mode)

### Prototype
```c
unsigned int WINAPI SetRegisterDump(int mode);
```
"""
function SetRegisterDump(mode)
    @ccall libandor2.SetRegisterDump(mode::Cint)::Cuint
end

"""
    SetRingExposureTimes(numTimes, times)

### Prototype
```c
unsigned int WINAPI SetRingExposureTimes(int numTimes, float * times);
```
"""
function SetRingExposureTimes(numTimes, times)
    @ccall libandor2.SetRingExposureTimes(numTimes::Cint, times::Ptr{Cfloat})::Cuint
end

"""
    SetSaturationEvent(saturationEvent)

### Prototype
```c
unsigned int WINAPI SetSaturationEvent(HANDLE saturationEvent);
```
"""
function SetSaturationEvent(saturationEvent)
    @ccall libandor2.SetSaturationEvent(saturationEvent::HANDLE)::Cuint
end

"""
    SetShutter(typ, mode, closingtime, openingtime)

### Prototype
```c
unsigned int WINAPI SetShutter(int typ, int mode, int closingtime, int openingtime);
```
"""
function SetShutter(typ, mode, closingtime, openingtime)
    @ccall libandor2.SetShutter(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint)::Cuint
end

"""
    SetShutterEx(typ, mode, closingtime, openingtime, extmode)

### Prototype
```c
unsigned int WINAPI SetShutterEx(int typ, int mode, int closingtime, int openingtime, int extmode);
```
"""
function SetShutterEx(typ, mode, closingtime, openingtime, extmode)
    @ccall libandor2.SetShutterEx(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint, extmode::Cint)::Cuint
end

"""
    SetShutters(typ, mode, closingtime, openingtime, exttype, extmode, dummy1, dummy2)

### Prototype
```c
unsigned int WINAPI SetShutters(int typ, int mode, int closingtime, int openingtime, int exttype, int extmode, int dummy1, int dummy2);
```
"""
function SetShutters(typ, mode, closingtime, openingtime, exttype, extmode, dummy1, dummy2)
    @ccall libandor2.SetShutters(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint, exttype::Cint, extmode::Cint, dummy1::Cint, dummy2::Cint)::Cuint
end

"""
    SetSifComment(comment)

### Prototype
```c
unsigned int WINAPI SetSifComment(char * comment);
```
"""
function SetSifComment(comment)
    @ccall libandor2.SetSifComment(comment::Cstring)::Cuint
end

"""
    SetSingleTrack(centre, height)

### Prototype
```c
unsigned int WINAPI SetSingleTrack(int centre, int height);
```
"""
function SetSingleTrack(centre, height)
    @ccall libandor2.SetSingleTrack(centre::Cint, height::Cint)::Cuint
end

"""
    SetSingleTrackHBin(bin)

### Prototype
```c
unsigned int WINAPI SetSingleTrackHBin(int bin);
```
"""
function SetSingleTrackHBin(bin)
    @ccall libandor2.SetSingleTrackHBin(bin::Cint)::Cuint
end

"""
    SetSpool(active, method, path, framebuffersize)

### Prototype
```c
unsigned int WINAPI SetSpool(int active, int method, char * path, int framebuffersize);
```
"""
function SetSpool(active, method, path, framebuffersize)
    @ccall libandor2.SetSpool(active::Cint, method::Cint, path::Cstring, framebuffersize::Cint)::Cuint
end

"""
    SetSpoolThreadCount(count)

### Prototype
```c
unsigned int WINAPI SetSpoolThreadCount(int count);
```
"""
function SetSpoolThreadCount(count)
    @ccall libandor2.SetSpoolThreadCount(count::Cint)::Cuint
end

"""
    SetStorageMode(mode)

### Prototype
```c
unsigned int WINAPI SetStorageMode(long mode);
```
"""
function SetStorageMode(mode)
    @ccall libandor2.SetStorageMode(mode::Clong)::Cuint
end

"""
    SetTECEvent(driverEvent)

### Prototype
```c
unsigned int WINAPI SetTECEvent(HANDLE driverEvent);
```
"""
function SetTECEvent(driverEvent)
    @ccall libandor2.SetTECEvent(driverEvent::HANDLE)::Cuint
end

"""
    SetTemperature(temperature)

### Prototype
```c
unsigned int WINAPI SetTemperature(int temperature);
```
"""
function SetTemperature(temperature)
    @ccall libandor2.SetTemperature(temperature::Cint)::Cuint
end

"""
    SetTemperatureEvent(temperatureEvent)

### Prototype
```c
unsigned int WINAPI SetTemperatureEvent(HANDLE temperatureEvent);
```
"""
function SetTemperatureEvent(temperatureEvent)
    @ccall libandor2.SetTemperatureEvent(temperatureEvent::HANDLE)::Cuint
end

"""
    SetTriggerMode(mode)

### Prototype
```c
unsigned int WINAPI SetTriggerMode(int mode);
```
"""
function SetTriggerMode(mode)
    @ccall libandor2.SetTriggerMode(mode::Cint)::Cuint
end

"""
    SetTriggerInvert(mode)

### Prototype
```c
unsigned int WINAPI SetTriggerInvert(int mode);
```
"""
function SetTriggerInvert(mode)
    @ccall libandor2.SetTriggerInvert(mode::Cint)::Cuint
end

"""
    GetTriggerLevelRange(minimum, maximum)

### Prototype
```c
unsigned int WINAPI GetTriggerLevelRange(float * minimum, float * maximum);
```
"""
function GetTriggerLevelRange(minimum, maximum)
    @ccall libandor2.GetTriggerLevelRange(minimum::Ptr{Cfloat}, maximum::Ptr{Cfloat})::Cuint
end

"""
    SetTriggerLevel(f_level)

### Prototype
```c
unsigned int WINAPI SetTriggerLevel(float f_level);
```
"""
function SetTriggerLevel(f_level)
    @ccall libandor2.SetTriggerLevel(f_level::Cfloat)::Cuint
end

"""
    SetIODirection(index, iDirection)

### Prototype
```c
unsigned int WINAPI SetIODirection(int index, int iDirection);
```
"""
function SetIODirection(index, iDirection)
    @ccall libandor2.SetIODirection(index::Cint, iDirection::Cint)::Cuint
end

"""
    SetIOLevel(index, iLevel)

### Prototype
```c
unsigned int WINAPI SetIOLevel(int index, int iLevel);
```
"""
function SetIOLevel(index, iLevel)
    @ccall libandor2.SetIOLevel(index::Cint, iLevel::Cint)::Cuint
end

"""
    SetUserEvent(userEvent)

### Prototype
```c
unsigned int WINAPI SetUserEvent(HANDLE userEvent);
```
"""
function SetUserEvent(userEvent)
    @ccall libandor2.SetUserEvent(userEvent::HANDLE)::Cuint
end

"""
    SetUSGenomics(width, height)

### Prototype
```c
unsigned int WINAPI SetUSGenomics(long width, long height);
```
"""
function SetUSGenomics(width, height)
    @ccall libandor2.SetUSGenomics(width::Clong, height::Clong)::Cuint
end

"""
    SetVerticalRowBuffer(rows)

### Prototype
```c
unsigned int WINAPI SetVerticalRowBuffer(int rows);
```
"""
function SetVerticalRowBuffer(rows)
    @ccall libandor2.SetVerticalRowBuffer(rows::Cint)::Cuint
end

"""
    SetVerticalSpeed(index)

### Prototype
```c
unsigned int WINAPI SetVerticalSpeed(int index);
```
"""
function SetVerticalSpeed(index)
    @ccall libandor2.SetVerticalSpeed(index::Cint)::Cuint
end

"""
    SetVirtualChip(state)

### Prototype
```c
unsigned int WINAPI SetVirtualChip(int state);
```
"""
function SetVirtualChip(state)
    @ccall libandor2.SetVirtualChip(state::Cint)::Cuint
end

"""
    SetVSAmplitude(index)

### Prototype
```c
unsigned int WINAPI SetVSAmplitude(int index);
```
"""
function SetVSAmplitude(index)
    @ccall libandor2.SetVSAmplitude(index::Cint)::Cuint
end

"""
    SetVSSpeed(index)

### Prototype
```c
unsigned int WINAPI SetVSSpeed(int index);
```
"""
function SetVSSpeed(index)
    @ccall libandor2.SetVSSpeed(index::Cint)::Cuint
end

"""
    ShutDown()

### Prototype
```c
unsigned int WINAPI ShutDown(void);
```
"""
function ShutDown()
    @ccall libandor2.ShutDown()::Cuint
end

"""
    StartAcquisition()

### Prototype
```c
unsigned int WINAPI StartAcquisition(void);
```
"""
function StartAcquisition()
    @ccall libandor2.StartAcquisition()::Cuint
end

"""
    UnMapPhysicalAddress()

### Prototype
```c
unsigned int WINAPI UnMapPhysicalAddress(void);
```
"""
function UnMapPhysicalAddress()
    @ccall libandor2.UnMapPhysicalAddress()::Cuint
end

"""
    UpdateDDGTimings()

### Prototype
```c
unsigned int WINAPI UpdateDDGTimings(void);
```
"""
function UpdateDDGTimings()
    @ccall libandor2.UpdateDDGTimings()::Cuint
end

"""
    WaitForAcquisition()

### Prototype
```c
unsigned int WINAPI WaitForAcquisition(void);
```
"""
function WaitForAcquisition()
    @ccall libandor2.WaitForAcquisition()::Cuint
end

"""
    WaitForAcquisitionByHandle(cameraHandle)

### Prototype
```c
unsigned int WINAPI WaitForAcquisitionByHandle(long cameraHandle);
```
"""
function WaitForAcquisitionByHandle(cameraHandle)
    @ccall libandor2.WaitForAcquisitionByHandle(cameraHandle::Clong)::Cuint
end

"""
    WaitForAcquisitionByHandleTimeOut(cameraHandle, iTimeOutMs)

### Prototype
```c
unsigned int WINAPI WaitForAcquisitionByHandleTimeOut(long cameraHandle, int iTimeOutMs);
```
"""
function WaitForAcquisitionByHandleTimeOut(cameraHandle, iTimeOutMs)
    @ccall libandor2.WaitForAcquisitionByHandleTimeOut(cameraHandle::Clong, iTimeOutMs::Cint)::Cuint
end

"""
    WaitForAcquisitionTimeOut(iTimeOutMs)

### Prototype
```c
unsigned int WINAPI WaitForAcquisitionTimeOut(int iTimeOutMs);
```
"""
function WaitForAcquisitionTimeOut(iTimeOutMs)
    @ccall libandor2.WaitForAcquisitionTimeOut(iTimeOutMs::Cint)::Cuint
end

"""
    WhiteBalance(wRed, wGreen, wBlue, fRelR, fRelB, info)

### Prototype
```c
unsigned int WINAPI WhiteBalance(WORD * wRed, WORD * wGreen, WORD * wBlue, float * fRelR, float * fRelB, WhiteBalanceInfo * info);
```
"""
function WhiteBalance(wRed, wGreen, wBlue, fRelR, fRelB, info)
    @ccall libandor2.WhiteBalance(wRed::Ptr{WORD}, wGreen::Ptr{WORD}, wBlue::Ptr{WORD}, fRelR::Ptr{Cfloat}, fRelB::Ptr{Cfloat}, info::Ptr{WhiteBalanceInfo})::Cuint
end

"""
    OA_Initialize(pcFilename, uiFileNameLen)

### Prototype
```c
unsigned int WINAPI OA_Initialize(const char * const pcFilename, unsigned int uiFileNameLen);
```
"""
function OA_Initialize(pcFilename, uiFileNameLen)
    @ccall libandor2.OA_Initialize(pcFilename::Cstring, uiFileNameLen::Cuint)::Cuint
end

"""
    OA_EnableMode(pcModeName)

### Prototype
```c
unsigned int WINAPI OA_EnableMode(const char * const pcModeName);
```
"""
function OA_EnableMode(pcModeName)
    @ccall libandor2.OA_EnableMode(pcModeName::Cstring)::Cuint
end

"""
    OA_GetModeAcqParams(pcModeName, pcListOfParams)

### Prototype
```c
unsigned int WINAPI OA_GetModeAcqParams(const char * const pcModeName, char * const pcListOfParams);
```
"""
function OA_GetModeAcqParams(pcModeName, pcListOfParams)
    @ccall libandor2.OA_GetModeAcqParams(pcModeName::Cstring, pcListOfParams::Cstring)::Cuint
end

"""
    OA_GetUserModeNames(pcListOfModes)

### Prototype
```c
unsigned int WINAPI OA_GetUserModeNames(char * pcListOfModes);
```
"""
function OA_GetUserModeNames(pcListOfModes)
    @ccall libandor2.OA_GetUserModeNames(pcListOfModes::Cstring)::Cuint
end

"""
    OA_GetPreSetModeNames(pcListOfModes)

### Prototype
```c
unsigned int WINAPI OA_GetPreSetModeNames(char * pcListOfModes);
```
"""
function OA_GetPreSetModeNames(pcListOfModes)
    @ccall libandor2.OA_GetPreSetModeNames(pcListOfModes::Cstring)::Cuint
end

"""
    OA_GetNumberOfUserModes(puiNumberOfModes)

### Prototype
```c
unsigned int WINAPI OA_GetNumberOfUserModes(unsigned int * const puiNumberOfModes);
```
"""
function OA_GetNumberOfUserModes(puiNumberOfModes)
    @ccall libandor2.OA_GetNumberOfUserModes(puiNumberOfModes::Ptr{Cuint})::Cuint
end

"""
    OA_GetNumberOfPreSetModes(puiNumberOfModes)

### Prototype
```c
unsigned int WINAPI OA_GetNumberOfPreSetModes(unsigned int * const puiNumberOfModes);
```
"""
function OA_GetNumberOfPreSetModes(puiNumberOfModes)
    @ccall libandor2.OA_GetNumberOfPreSetModes(puiNumberOfModes::Ptr{Cuint})::Cuint
end

"""
    OA_GetNumberOfAcqParams(pcModeName, puiNumberOfParams)

### Prototype
```c
unsigned int WINAPI OA_GetNumberOfAcqParams(const char * const pcModeName, unsigned int * const puiNumberOfParams);
```
"""
function OA_GetNumberOfAcqParams(pcModeName, puiNumberOfParams)
    @ccall libandor2.OA_GetNumberOfAcqParams(pcModeName::Cstring, puiNumberOfParams::Ptr{Cuint})::Cuint
end

"""
    OA_AddMode(pcModeName, uiModeNameLen, pcModeDescription, uiModeDescriptionLen)

### Prototype
```c
unsigned int WINAPI OA_AddMode(char * pcModeName, unsigned int uiModeNameLen, char * pcModeDescription, unsigned int uiModeDescriptionLen);
```
"""
function OA_AddMode(pcModeName, uiModeNameLen, pcModeDescription, uiModeDescriptionLen)
    @ccall libandor2.OA_AddMode(pcModeName::Cstring, uiModeNameLen::Cuint, pcModeDescription::Cstring, uiModeDescriptionLen::Cuint)::Cuint
end

"""
    OA_WriteToFile(pcFileName, uiFileNameLen)

### Prototype
```c
unsigned int WINAPI OA_WriteToFile(const char * const pcFileName, unsigned int uiFileNameLen);
```
"""
function OA_WriteToFile(pcFileName, uiFileNameLen)
    @ccall libandor2.OA_WriteToFile(pcFileName::Cstring, uiFileNameLen::Cuint)::Cuint
end

"""
    OA_DeleteMode(pcModeName, uiModeNameLen)

### Prototype
```c
unsigned int WINAPI OA_DeleteMode(const char * const pcModeName, unsigned int uiModeNameLen);
```
"""
function OA_DeleteMode(pcModeName, uiModeNameLen)
    @ccall libandor2.OA_DeleteMode(pcModeName::Cstring, uiModeNameLen::Cuint)::Cuint
end

"""
    OA_SetInt(pcModeName, pcModeParam, iIntValue)

### Prototype
```c
unsigned int WINAPI OA_SetInt(const char * const pcModeName, const char * pcModeParam, const int iIntValue);
```
"""
function OA_SetInt(pcModeName, pcModeParam, iIntValue)
    @ccall libandor2.OA_SetInt(pcModeName::Cstring, pcModeParam::Cstring, iIntValue::Cint)::Cuint
end

"""
    OA_SetFloat(pcModeName, pcModeParam, fFloatValue)

### Prototype
```c
unsigned int WINAPI OA_SetFloat(const char * const pcModeName, const char * pcModeParam, const float fFloatValue);
```
"""
function OA_SetFloat(pcModeName, pcModeParam, fFloatValue)
    @ccall libandor2.OA_SetFloat(pcModeName::Cstring, pcModeParam::Cstring, fFloatValue::Cfloat)::Cuint
end

"""
    OA_SetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)

### Prototype
```c
unsigned int WINAPI OA_SetString(const char * const pcModeName, const char * pcModeParam, char * pcStringValue, const unsigned int uiStringLen);
```
"""
function OA_SetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)
    @ccall libandor2.OA_SetString(pcModeName::Cstring, pcModeParam::Cstring, pcStringValue::Cstring, uiStringLen::Cuint)::Cuint
end

"""
    OA_GetInt(pcModeName, pcModeParam, iIntValue)

### Prototype
```c
unsigned int WINAPI OA_GetInt(const char * const pcModeName, const char * const pcModeParam, int * iIntValue);
```
"""
function OA_GetInt(pcModeName, pcModeParam, iIntValue)
    @ccall libandor2.OA_GetInt(pcModeName::Cstring, pcModeParam::Cstring, iIntValue::Ptr{Cint})::Cuint
end

"""
    OA_GetFloat(pcModeName, pcModeParam, fFloatValue)

### Prototype
```c
unsigned int WINAPI OA_GetFloat(const char * const pcModeName, const char * const pcModeParam, float * fFloatValue);
```
"""
function OA_GetFloat(pcModeName, pcModeParam, fFloatValue)
    @ccall libandor2.OA_GetFloat(pcModeName::Cstring, pcModeParam::Cstring, fFloatValue::Ptr{Cfloat})::Cuint
end

"""
    OA_GetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)

### Prototype
```c
unsigned int WINAPI OA_GetString(const char * const pcModeName, const char * const pcModeParam, char * pcStringValue, const unsigned int uiStringLen);
```
"""
function OA_GetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)
    @ccall libandor2.OA_GetString(pcModeName::Cstring, pcModeParam::Cstring, pcStringValue::Cstring, uiStringLen::Cuint)::Cuint
end

"""
    Filter_SetMode(mode)

### Prototype
```c
unsigned int WINAPI Filter_SetMode(unsigned int mode);
```
"""
function Filter_SetMode(mode)
    @ccall libandor2.Filter_SetMode(mode::Cuint)::Cuint
end

"""
    Filter_GetMode(mode)

### Prototype
```c
unsigned int WINAPI Filter_GetMode(unsigned int * mode);
```
"""
function Filter_GetMode(mode)
    @ccall libandor2.Filter_GetMode(mode::Ptr{Cuint})::Cuint
end

"""
    Filter_SetThreshold(threshold)

### Prototype
```c
unsigned int WINAPI Filter_SetThreshold(float threshold);
```
"""
function Filter_SetThreshold(threshold)
    @ccall libandor2.Filter_SetThreshold(threshold::Cfloat)::Cuint
end

"""
    Filter_GetThreshold(threshold)

### Prototype
```c
unsigned int WINAPI Filter_GetThreshold(float * threshold);
```
"""
function Filter_GetThreshold(threshold)
    @ccall libandor2.Filter_GetThreshold(threshold::Ptr{Cfloat})::Cuint
end

"""
    Filter_SetDataAveragingMode(mode)

### Prototype
```c
unsigned int WINAPI Filter_SetDataAveragingMode(int mode);
```
"""
function Filter_SetDataAveragingMode(mode)
    @ccall libandor2.Filter_SetDataAveragingMode(mode::Cint)::Cuint
end

"""
    Filter_GetDataAveragingMode(mode)

### Prototype
```c
unsigned int WINAPI Filter_GetDataAveragingMode(int * mode);
```
"""
function Filter_GetDataAveragingMode(mode)
    @ccall libandor2.Filter_GetDataAveragingMode(mode::Ptr{Cint})::Cuint
end

"""
    Filter_SetAveragingFrameCount(frames)

### Prototype
```c
unsigned int WINAPI Filter_SetAveragingFrameCount(int frames);
```
"""
function Filter_SetAveragingFrameCount(frames)
    @ccall libandor2.Filter_SetAveragingFrameCount(frames::Cint)::Cuint
end

"""
    Filter_GetAveragingFrameCount(frames)

### Prototype
```c
unsigned int WINAPI Filter_GetAveragingFrameCount(int * frames);
```
"""
function Filter_GetAveragingFrameCount(frames)
    @ccall libandor2.Filter_GetAveragingFrameCount(frames::Ptr{Cint})::Cuint
end

"""
    Filter_SetAveragingFactor(averagingFactor)

### Prototype
```c
unsigned int WINAPI Filter_SetAveragingFactor(int averagingFactor);
```
"""
function Filter_SetAveragingFactor(averagingFactor)
    @ccall libandor2.Filter_SetAveragingFactor(averagingFactor::Cint)::Cuint
end

"""
    Filter_GetAveragingFactor(averagingFactor)

### Prototype
```c
unsigned int WINAPI Filter_GetAveragingFactor(int * averagingFactor);
```
"""
function Filter_GetAveragingFactor(averagingFactor)
    @ccall libandor2.Filter_GetAveragingFactor(averagingFactor::Ptr{Cint})::Cuint
end

"""
    PostProcessNoiseFilter(pInputImage, pOutputImage, iOutputBufferSize, iBaseline, iMode, fThreshold, iHeight, iWidth)

### Prototype
```c
unsigned int WINAPI PostProcessNoiseFilter(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iBaseline, int iMode, float fThreshold, int iHeight, int iWidth);
```
"""
function PostProcessNoiseFilter(pInputImage, pOutputImage, iOutputBufferSize, iBaseline, iMode, fThreshold, iHeight, iWidth)
    @ccall libandor2.PostProcessNoiseFilter(pInputImage::Ptr{Clong}, pOutputImage::Ptr{Clong}, iOutputBufferSize::Cint, iBaseline::Cint, iMode::Cint, fThreshold::Cfloat, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessCountConvert(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iBaseline, iMode, iEmGain, fQE, fSensitivity, iHeight, iWidth)

### Prototype
```c
unsigned int WINAPI PostProcessCountConvert(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iBaseline, int iMode, int iEmGain, float fQE, float fSensitivity, int iHeight, int iWidth);
```
"""
function PostProcessCountConvert(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iBaseline, iMode, iEmGain, fQE, fSensitivity, iHeight, iWidth)
    @ccall libandor2.PostProcessCountConvert(pInputImage::Ptr{Clong}, pOutputImage::Ptr{Clong}, iOutputBufferSize::Cint, iNumImages::Cint, iBaseline::Cint, iMode::Cint, iEmGain::Cint, fQE::Cfloat, fSensitivity::Cfloat, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessPhotonCounting(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iNumframes, iNumberOfThresholds, pfThreshold, iHeight, iWidth)

### Prototype
```c
unsigned int WINAPI PostProcessPhotonCounting(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iNumframes, int iNumberOfThresholds, float * pfThreshold, int iHeight, int iWidth);
```
"""
function PostProcessPhotonCounting(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iNumframes, iNumberOfThresholds, pfThreshold, iHeight, iWidth)
    @ccall libandor2.PostProcessPhotonCounting(pInputImage::Ptr{Clong}, pOutputImage::Ptr{Clong}, iOutputBufferSize::Cint, iNumImages::Cint, iNumframes::Cint, iNumberOfThresholds::Cint, pfThreshold::Ptr{Cfloat}, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessDataAveraging(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor)

### Prototype
```c
unsigned int WINAPI PostProcessDataAveraging(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iAveragingFilterMode, int iHeight, int iWidth, int iFrameCount, int iAveragingFactor);
```
"""
function PostProcessDataAveraging(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor)
    @ccall libandor2.PostProcessDataAveraging(pInputImage::Ptr{Clong}, pOutputImage::Ptr{Clong}, iOutputBufferSize::Cint, iNumImages::Cint, iAveragingFilterMode::Cint, iHeight::Cint, iWidth::Cint, iFrameCount::Cint, iAveragingFactor::Cint)::Cuint
end

const at_32 = Clong

const at_u32 = Culong

const at_64 = Clonglong

const at_u64 = Culonglong

const AT_NoOfVersionInfoIds = 2

const AT_VERSION_INFO_LEN = 80

const AT_CONTROLLER_CARD_MODEL_LEN = 80

const AT_DDGLite_ControlBit_GlobalEnable = 0x01

const AT_DDGLite_ControlBit_ChannelEnable = 0x01

const AT_DDGLite_ControlBit_FreeRun = 0x02

const AT_DDGLite_ControlBit_DisableOnFrame = 0x04

const AT_DDGLite_ControlBit_RestartOnFire = 0x08

const AT_DDGLite_ControlBit_Invert = 0x10

const AT_DDGLite_ControlBit_EnableOnFire = 0x20

const AT_DDG_POLARITY_POSITIVE = 0

const AT_DDG_POLARITY_NEGATIVE = 1

const AT_DDG_TERMINATION_50OHMS = 0

const AT_DDG_TERMINATION_HIGHZ = 1

const AT_STEPMODE_CONSTANT = 0

const AT_STEPMODE_EXPONENTIAL = 1

const AT_STEPMODE_LOGARITHMIC = 2

const AT_STEPMODE_LINEAR = 3

const AT_STEPMODE_OFF = 100

const AT_GATEMODE_FIRE_AND_GATE = 0

const AT_GATEMODE_FIRE_ONLY = 1

const AT_GATEMODE_GATE_ONLY = 2

const AT_GATEMODE_CW_ON = 3

const AT_GATEMODE_CW_OFF = 4

const AT_GATEMODE_DDG = 5

const DRV_ERROR_CODES = 20001

const DRV_SUCCESS = 20002

const DRV_VXDNOTINSTALLED = 20003

const DRV_ERROR_SCAN = 20004

const DRV_ERROR_CHECK_SUM = 20005

const DRV_ERROR_FILELOAD = 20006

const DRV_UNKNOWN_FUNCTION = 20007

const DRV_ERROR_VXD_INIT = 20008

const DRV_ERROR_ADDRESS = 20009

const DRV_ERROR_PAGELOCK = 20010

const DRV_ERROR_PAGEUNLOCK = 20011

const DRV_ERROR_BOARDTEST = 20012

const DRV_ERROR_ACK = 20013

const DRV_ERROR_UP_FIFO = 20014

const DRV_ERROR_PATTERN = 20015

const DRV_ACQUISITION_ERRORS = 20017

const DRV_ACQ_BUFFER = 20018

const DRV_ACQ_DOWNFIFO_FULL = 20019

const DRV_PROC_UNKONWN_INSTRUCTION = 20020

const DRV_ILLEGAL_OP_CODE = 20021

const DRV_KINETIC_TIME_NOT_MET = 20022

const DRV_ACCUM_TIME_NOT_MET = 20023

const DRV_NO_NEW_DATA = 20024

const DRV_PCI_DMA_FAIL = 20025

const DRV_SPOOLERROR = 20026

const DRV_SPOOLSETUPERROR = 20027

const DRV_FILESIZELIMITERROR = 20028

const DRV_ERROR_FILESAVE = 20029

const DRV_TEMPERATURE_CODES = 20033

const DRV_TEMPERATURE_OFF = 20034

const DRV_TEMPERATURE_NOT_STABILIZED = 20035

const DRV_TEMPERATURE_STABILIZED = 20036

const DRV_TEMPERATURE_NOT_REACHED = 20037

const DRV_TEMPERATURE_OUT_RANGE = 20038

const DRV_TEMPERATURE_NOT_SUPPORTED = 20039

const DRV_TEMPERATURE_DRIFT = 20040

const DRV_TEMP_CODES = 20033

const DRV_TEMP_OFF = 20034

const DRV_TEMP_NOT_STABILIZED = 20035

const DRV_TEMP_STABILIZED = 20036

const DRV_TEMP_NOT_REACHED = 20037

const DRV_TEMP_OUT_RANGE = 20038

const DRV_TEMP_NOT_SUPPORTED = 20039

const DRV_TEMP_DRIFT = 20040

const DRV_GENERAL_ERRORS = 20049

const DRV_INVALID_AUX = 20050

const DRV_COF_NOTLOADED = 20051

const DRV_FPGAPROG = 20052

const DRV_FLEXERROR = 20053

const DRV_GPIBERROR = 20054

const DRV_EEPROMVERSIONERROR = 20055

const DRV_DATATYPE = 20064

const DRV_DRIVER_ERRORS = 20065

const DRV_P1INVALID = 20066

const DRV_P2INVALID = 20067

const DRV_P3INVALID = 20068

const DRV_P4INVALID = 20069

const DRV_INIERROR = 20070

const DRV_COFERROR = 20071

const DRV_ACQUIRING = 20072

const DRV_IDLE = 20073

const DRV_TEMPCYCLE = 20074

const DRV_NOT_INITIALIZED = 20075

const DRV_P5INVALID = 20076

const DRV_P6INVALID = 20077

const DRV_INVALID_MODE = 20078

const DRV_INVALID_FILTER = 20079

const DRV_I2CERRORS = 20080

const DRV_I2CDEVNOTFOUND = 20081

const DRV_I2CTIMEOUT = 20082

const DRV_P7INVALID = 20083

const DRV_P8INVALID = 20084

const DRV_P9INVALID = 20085

const DRV_P10INVALID = 20086

const DRV_P11INVALID = 20087

const DRV_USBERROR = 20089

const DRV_IOCERROR = 20090

const DRV_VRMVERSIONERROR = 20091

const DRV_GATESTEPERROR = 20092

const DRV_USB_INTERRUPT_ENDPOINT_ERROR = 20093

const DRV_RANDOM_TRACK_ERROR = 20094

const DRV_INVALID_TRIGGER_MODE = 20095

const DRV_LOAD_FIRMWARE_ERROR = 20096

const DRV_DIVIDE_BY_ZERO_ERROR = 20097

const DRV_INVALID_RINGEXPOSURES = 20098

const DRV_BINNING_ERROR = 20099

const DRV_INVALID_AMPLIFIER = 20100

const DRV_INVALID_COUNTCONVERT_MODE = 20101

const DRV_ERROR_NOCAMERA = 20990

const DRV_NOT_SUPPORTED = 20991

const DRV_NOT_AVAILABLE = 20992

const DRV_ERROR_MAP = 20115

const DRV_ERROR_UNMAP = 20116

const DRV_ERROR_MDL = 20117

const DRV_ERROR_UNMDL = 20118

const DRV_ERROR_BUFFSIZE = 20119

const DRV_ERROR_NOHANDLE = 20121

const DRV_GATING_NOT_AVAILABLE = 20130

const DRV_FPGA_VOLTAGE_ERROR = 20131

const DRV_OW_CMD_FAIL = 20150

const DRV_OWMEMORY_BAD_ADDR = 20151

const DRV_OWCMD_NOT_AVAILABLE = 20152

const DRV_OW_NO_SLAVES = 20153

const DRV_OW_NOT_INITIALIZED = 20154

const DRV_OW_ERROR_SLAVE_NUM = 20155

const DRV_MSTIMINGS_ERROR = 20156

const DRV_OA_NULL_ERROR = 20173

const DRV_OA_PARSE_DTD_ERROR = 20174

const DRV_OA_DTD_VALIDATE_ERROR = 20175

const DRV_OA_FILE_ACCESS_ERROR = 20176

const DRV_OA_FILE_DOES_NOT_EXIST = 20177

const DRV_OA_XML_INVALID_OR_NOT_FOUND_ERROR = 20178

const DRV_OA_PRESET_FILE_NOT_LOADED = 20179

const DRV_OA_USER_FILE_NOT_LOADED = 20180

const DRV_OA_PRESET_AND_USER_FILE_NOT_LOADED = 20181

const DRV_OA_INVALID_FILE = 20182

const DRV_OA_FILE_HAS_BEEN_MODIFIED = 20183

const DRV_OA_BUFFER_FULL = 20184

const DRV_OA_INVALID_STRING_LENGTH = 20185

const DRV_OA_INVALID_CHARS_IN_NAME = 20186

const DRV_OA_INVALID_NAMING = 20187

const DRV_OA_GET_CAMERA_ERROR = 20188

const DRV_OA_MODE_ALREADY_EXISTS = 20189

const DRV_OA_STRINGS_NOT_EQUAL = 20190

const DRV_OA_NO_USER_DATA = 20191

const DRV_OA_VALUE_NOT_SUPPORTED = 20192

const DRV_OA_MODE_DOES_NOT_EXIST = 20193

const DRV_OA_CAMERA_NOT_SUPPORTED = 20194

const DRV_OA_FAILED_TO_GET_MODE = 20195

const DRV_PROCESSING_FAILED = 20211

const AC_ACQMODE_SINGLE = 1

const AC_ACQMODE_VIDEO = 2

const AC_ACQMODE_ACCUMULATE = 4

const AC_ACQMODE_KINETIC = 8

const AC_ACQMODE_FRAMETRANSFER = 16

const AC_ACQMODE_FASTKINETICS = 32

const AC_ACQMODE_OVERLAP = 64

const AC_ACQMODE_SUPERKINETICS = 128

const AC_ACQMODE_TIMESCAN = 256

const AC_READMODE_FULLIMAGE = 1

const AC_READMODE_SUBIMAGE = 2

const AC_READMODE_SINGLETRACK = 4

const AC_READMODE_FVB = 8

const AC_READMODE_MULTITRACK = 16

const AC_READMODE_RANDOMTRACK = 32

const AC_READMODE_MULTITRACKSCAN = 64

const AC_TRIGGERMODE_INTERNAL = 1

const AC_TRIGGERMODE_EXTERNAL = 2

const AC_TRIGGERMODE_EXTERNAL_FVB_EM = 4

const AC_TRIGGERMODE_CONTINUOUS = 8

const AC_TRIGGERMODE_EXTERNALSTART = 16

const AC_TRIGGERMODE_EXTERNALEXPOSURE = 32

const AC_TRIGGERMODE_INVERTED = 0x40

const AC_TRIGGERMODE_EXTERNAL_CHARGESHIFTING = 0x80

const AC_TRIGGERMODE_BULB = 32

const AC_CAMERATYPE_PDA = 0

const AC_CAMERATYPE_IXON = 1

const AC_CAMERATYPE_ICCD = 2

const AC_CAMERATYPE_EMCCD = 3

const AC_CAMERATYPE_CCD = 4

const AC_CAMERATYPE_ISTAR = 5

const AC_CAMERATYPE_VIDEO = 6

const AC_CAMERATYPE_IDUS = 7

const AC_CAMERATYPE_NEWTON = 8

const AC_CAMERATYPE_SURCAM = 9

const AC_CAMERATYPE_USBICCD = 10

const AC_CAMERATYPE_LUCA = 11

const AC_CAMERATYPE_RESERVED = 12

const AC_CAMERATYPE_IKON = 13

const AC_CAMERATYPE_INGAAS = 14

const AC_CAMERATYPE_IVAC = 15

const AC_CAMERATYPE_UNPROGRAMMED = 16

const AC_CAMERATYPE_CLARA = 17

const AC_CAMERATYPE_USBISTAR = 18

const AC_CAMERATYPE_SIMCAM = 19

const AC_CAMERATYPE_NEO = 20

const AC_CAMERATYPE_IXONULTRA = 21

const AC_CAMERATYPE_VOLMOS = 22

const AC_CAMERATYPE_IVAC_CCD = 23

const AC_CAMERATYPE_ASPEN = 24

const AC_CAMERATYPE_ASCENT = 25

const AC_CAMERATYPE_ALTA = 26

const AC_CAMERATYPE_ALTAF = 27

const AC_CAMERATYPE_IKONXL = 28

const AC_CAMERATYPE_RES1 = 29

const AC_PIXELMODE_8BIT = 1

const AC_PIXELMODE_14BIT = 2

const AC_PIXELMODE_16BIT = 4

const AC_PIXELMODE_32BIT = 8

const AC_PIXELMODE_MONO = 0x00000000

const AC_PIXELMODE_RGB = 0x00010000

const AC_PIXELMODE_CMY = 0x00020000

const AC_SETFUNCTION_VREADOUT = 0x01

const AC_SETFUNCTION_HREADOUT = 0x02

const AC_SETFUNCTION_TEMPERATURE = 0x04

const AC_SETFUNCTION_MCPGAIN = 0x08

const AC_SETFUNCTION_EMCCDGAIN = 0x10

const AC_SETFUNCTION_BASELINECLAMP = 0x20

const AC_SETFUNCTION_VSAMPLITUDE = 0x40

const AC_SETFUNCTION_HIGHCAPACITY = 0x80

const AC_SETFUNCTION_BASELINEOFFSET = 0x0100

const AC_SETFUNCTION_PREAMPGAIN = 0x0200

const AC_SETFUNCTION_CROPMODE = 0x0400

const AC_SETFUNCTION_DMAPARAMETERS = 0x0800

const AC_SETFUNCTION_HORIZONTALBIN = 0x1000

const AC_SETFUNCTION_MULTITRACKHRANGE = 0x2000

const AC_SETFUNCTION_RANDOMTRACKNOGAPS = 0x4000

const AC_SETFUNCTION_EMADVANCED = 0x8000

const AC_SETFUNCTION_GATEMODE = 0x00010000

const AC_SETFUNCTION_DDGTIMES = 0x00020000

const AC_SETFUNCTION_IOC = 0x00040000

const AC_SETFUNCTION_INTELLIGATE = 0x00080000

const AC_SETFUNCTION_INSERTION_DELAY = 0x00100000

const AC_SETFUNCTION_GATESTEP = 0x00200000

const AC_SETFUNCTION_GATEDELAYSTEP = 0x00200000

const AC_SETFUNCTION_TRIGGERTERMINATION = 0x00400000

const AC_SETFUNCTION_EXTENDEDNIR = 0x00800000

const AC_SETFUNCTION_SPOOLTHREADCOUNT = 0x01000000

const AC_SETFUNCTION_REGISTERPACK = 0x02000000

const AC_SETFUNCTION_PRESCANS = 0x04000000

const AC_SETFUNCTION_GATEWIDTHSTEP = 0x08000000

const AC_SETFUNCTION_EXTENDED_CROP_MODE = 0x10000000

const AC_SETFUNCTION_GAIN = 8

const AC_SETFUNCTION_ICCDGAIN = 8

const AC_GETFUNCTION_TEMPERATURE = 0x01

const AC_GETFUNCTION_TARGETTEMPERATURE = 0x02

const AC_GETFUNCTION_TEMPERATURERANGE = 0x04

const AC_GETFUNCTION_DETECTORSIZE = 0x08

const AC_GETFUNCTION_MCPGAIN = 0x10

const AC_GETFUNCTION_EMCCDGAIN = 0x20

const AC_GETFUNCTION_HVFLAG = 0x40

const AC_GETFUNCTION_GATEMODE = 0x80

const AC_GETFUNCTION_DDGTIMES = 0x0100

const AC_GETFUNCTION_IOC = 0x0200

const AC_GETFUNCTION_INTELLIGATE = 0x0400

const AC_GETFUNCTION_INSERTION_DELAY = 0x0800

const AC_GETFUNCTION_GATESTEP = 0x1000

const AC_GETFUNCTION_GATEDELAYSTEP = 0x1000

const AC_GETFUNCTION_PHOSPHORSTATUS = 0x2000

const AC_GETFUNCTION_MCPGAINTABLE = 0x4000

const AC_GETFUNCTION_BASELINECLAMP = 0x8000

const AC_GETFUNCTION_GATEWIDTHSTEP = 0x00010000

const AC_GETFUNCTION_GAIN = 0x10

const AC_GETFUNCTION_ICCDGAIN = 0x10

const AC_FEATURES_POLLING = 1

const AC_FEATURES_EVENTS = 2

const AC_FEATURES_SPOOLING = 4

const AC_FEATURES_SHUTTER = 8

const AC_FEATURES_SHUTTEREX = 16

const AC_FEATURES_EXTERNAL_I2C = 32

const AC_FEATURES_SATURATIONEVENT = 64

const AC_FEATURES_FANCONTROL = 128

const AC_FEATURES_MIDFANCONTROL = 256

const AC_FEATURES_TEMPERATUREDURINGACQUISITION = 512

const AC_FEATURES_KEEPCLEANCONTROL = 1024

const AC_FEATURES_DDGLITE = 0x0800

const AC_FEATURES_FTEXTERNALEXPOSURE = 0x1000

const AC_FEATURES_KINETICEXTERNALEXPOSURE = 0x2000

const AC_FEATURES_DACCONTROL = 0x4000

const AC_FEATURES_METADATA = 0x8000

const AC_FEATURES_IOCONTROL = 0x00010000

const AC_FEATURES_PHOTONCOUNTING = 0x00020000

const AC_FEATURES_COUNTCONVERT = 0x00040000

const AC_FEATURES_DUALMODE = 0x00080000

const AC_FEATURES_OPTACQUIRE = 0x00100000

const AC_FEATURES_REALTIMESPURIOUSNOISEFILTER = 0x00200000

const AC_FEATURES_POSTPROCESSSPURIOUSNOISEFILTER = 0x00400000

const AC_FEATURES_DUALPREAMPGAIN = 0x00800000

const AC_FEATURES_DEFECT_CORRECTION = 0x01000000

const AC_FEATURES_STARTOFEXPOSURE_EVENT = 0x02000000

const AC_FEATURES_ENDOFEXPOSURE_EVENT = 0x04000000

const AC_FEATURES_CAMERALINK = 0x08000000

const AC_FEATURES_FIFOFULL_EVENT = 0x10000000

const AC_FEATURES_SENSOR_PORT_CONFIGURATION = 0x20000000

const AC_FEATURES_SENSOR_COMPENSATION = 0x40000000

const AC_FEATURES_IRIG_SUPPORT = 0x80000000

const AC_EMGAIN_8BIT = 1

const AC_EMGAIN_12BIT = 2

const AC_EMGAIN_LINEAR12 = 4

const AC_EMGAIN_REAL12 = 8

end # module
