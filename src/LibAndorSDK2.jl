module LibAndorSDK2

using CEnum

@static if Sys.islinux()
    if Sys.ARCH === :x86_64
        const libandor = "libandor-x86_64.so"
    else
        const libandor = "libandor-i386.so"
    end
elseif Sys.iswindows()
    if Sys.ARCH === :x86_64
        const libandor = "atmcd64m.dll"
    else
        const libandor = "atmcd32m.dll"
    end
else
    error("Unsupported OS")
end

struct SYSTEMTIME
    wYear::Cushort
    wMonth::Cushort
    wDayOfWeek::Cushort
    wDay::Cushort
    wHour::Cushort
    wMinute::Cushort
    wSecond::Cushort
    wMilliseconds::Cushort
end

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
    ulSize::Cuint
    ulAcqModes::Cuint
    ulReadModes::Cuint
    ulTriggerModes::Cuint
    ulCameraType::Cuint
    ulPixelMode::Cuint
    ulSetFunctions::Cuint
    ulGetFunctions::Cuint
    ulFeatures::Cuint
    ulPCICard::Cuint
    ulEMGainCapability::Cuint
    ulFTReadModes::Cuint
    ulFeatures2::Cuint
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

# no prototype is found for this function at atmcdLXd.h:147:14, please use with caution
"""
    AbortAcquisition()

### Prototype
```c
unsigned int AbortAcquisition();
```
"""
function AbortAcquisition()
    @ccall libandor.AbortAcquisition()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:148:14, please use with caution
"""
    CancelWait()

### Prototype
```c
unsigned int CancelWait();
```
"""
function CancelWait()
    @ccall libandor.CancelWait()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:149:14, please use with caution
"""
    CoolerOFF()

### Prototype
```c
unsigned int CoolerOFF();
```
"""
function CoolerOFF()
    @ccall libandor.CoolerOFF()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:150:14, please use with caution
"""
    CoolerON()

### Prototype
```c
unsigned int CoolerON();
```
"""
function CoolerON()
    @ccall libandor.CoolerON()::Cuint
end

"""
    DemosaicImage(grey, red, green, blue, info)

### Prototype
```c
unsigned int DemosaicImage(unsigned short * grey, unsigned short * red, unsigned short * green, unsigned short * blue, ColorDemosaicInfo * info);
```
"""
function DemosaicImage(grey, red, green, blue, info)
    @ccall libandor.DemosaicImage(grey::Ptr{Cushort}, red::Ptr{Cushort}, green::Ptr{Cushort}, blue::Ptr{Cushort}, info::Ptr{ColorDemosaicInfo})::Cuint
end

"""
    EnableKeepCleans(iMode)

### Prototype
```c
unsigned int EnableKeepCleans(int iMode);
```
"""
function EnableKeepCleans(iMode)
    @ccall libandor.EnableKeepCleans(iMode::Cint)::Cuint
end

"""
    EnableSensorCompensation(iMode)

### Prototype
```c
unsigned int EnableSensorCompensation(int iMode);
```
"""
function EnableSensorCompensation(iMode)
    @ccall libandor.EnableSensorCompensation(iMode::Cint)::Cuint
end

"""
    SetIRIGModulation(mode)

### Prototype
```c
unsigned int SetIRIGModulation(char mode);
```
"""
function SetIRIGModulation(mode)
    @ccall libandor.SetIRIGModulation(mode::Cchar)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:155:14, please use with caution
"""
    FreeInternalMemory()

### Prototype
```c
unsigned int FreeInternalMemory();
```
"""
function FreeInternalMemory()
    @ccall libandor.FreeInternalMemory()::Cuint
end

"""
    GetAcquiredData(arr, size)

### Prototype
```c
unsigned int GetAcquiredData(at_32 * arr, at_u32 size);
```
"""
function GetAcquiredData(arr, size)
    @ccall libandor.GetAcquiredData(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetAcquiredData16(arr, size)

### Prototype
```c
unsigned int GetAcquiredData16(unsigned short * arr, at_u32 size);
```
"""
function GetAcquiredData16(arr, size)
    @ccall libandor.GetAcquiredData16(arr::Ptr{Cushort}, size::Cuint)::Cuint
end

"""
    GetAcquiredFloatData(arr, size)

### Prototype
```c
unsigned int GetAcquiredFloatData(float * arr, at_u32 size);
```
"""
function GetAcquiredFloatData(arr, size)
    @ccall libandor.GetAcquiredFloatData(arr::Ptr{Cfloat}, size::Cuint)::Cuint
end

"""
    GetAcquisitionProgress(acc, series)

### Prototype
```c
unsigned int GetAcquisitionProgress(at_32 * acc, at_32 * series);
```
"""
function GetAcquisitionProgress(acc, series)
    @ccall libandor.GetAcquisitionProgress(acc::Ptr{Cint}, series::Ptr{Cint})::Cuint
end

"""
    GetAcquisitionTimings(exposure, accumulate, kinetic)

### Prototype
```c
unsigned int GetAcquisitionTimings(float * exposure, float * accumulate, float * kinetic);
```
"""
function GetAcquisitionTimings(exposure, accumulate, kinetic)
    @ccall libandor.GetAcquisitionTimings(exposure::Ptr{Cfloat}, accumulate::Ptr{Cfloat}, kinetic::Ptr{Cfloat})::Cuint
end

"""
    GetAdjustedRingExposureTimes(inumTimes, fptimes)

### Prototype
```c
unsigned int GetAdjustedRingExposureTimes(int inumTimes, float * fptimes);
```
"""
function GetAdjustedRingExposureTimes(inumTimes, fptimes)
    @ccall libandor.GetAdjustedRingExposureTimes(inumTimes::Cint, fptimes::Ptr{Cfloat})::Cuint
end

"""
    GetAllDMAData(arr, size)

### Prototype
```c
unsigned int GetAllDMAData(at_32 * arr, at_u32 size);
```
"""
function GetAllDMAData(arr, size)
    @ccall libandor.GetAllDMAData(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetAmpDesc(index, name, length)

### Prototype
```c
unsigned int GetAmpDesc(int index, char * name, int length);
```
"""
function GetAmpDesc(index, name, length)
    @ccall libandor.GetAmpDesc(index::Cint, name::Cstring, length::Cint)::Cuint
end

"""
    GetAmpMaxSpeed(index, speed)

### Prototype
```c
unsigned int GetAmpMaxSpeed(int index, float * speed);
```
"""
function GetAmpMaxSpeed(index, speed)
    @ccall libandor.GetAmpMaxSpeed(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetAvailableCameras(totalCameras)

### Prototype
```c
unsigned int GetAvailableCameras(at_32 * totalCameras);
```
"""
function GetAvailableCameras(totalCameras)
    @ccall libandor.GetAvailableCameras(totalCameras::Ptr{Cint})::Cuint
end

"""
    GetBackground(arr, size)

### Prototype
```c
unsigned int GetBackground(at_32 * arr, at_u32 size);
```
"""
function GetBackground(arr, size)
    @ccall libandor.GetBackground(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetBaselineClamp(state)

### Prototype
```c
unsigned int GetBaselineClamp(int * state);
```
"""
function GetBaselineClamp(state)
    @ccall libandor.GetBaselineClamp(state::Ptr{Cint})::Cuint
end

"""
    GetBitDepth(channel, depth)

### Prototype
```c
unsigned int GetBitDepth(int channel, int * depth);
```
"""
function GetBitDepth(channel, depth)
    @ccall libandor.GetBitDepth(channel::Cint, depth::Ptr{Cint})::Cuint
end

"""
    GetBitsPerPixel(readout_index, index, value)

### Prototype
```c
unsigned int GetBitsPerPixel(int readout_index, int index, int * value);
```
"""
function GetBitsPerPixel(readout_index, index, value)
    @ccall libandor.GetBitsPerPixel(readout_index::Cint, index::Cint, value::Ptr{Cint})::Cuint
end

"""
    GetCameraEventStatus(camStatus)

### Prototype
```c
unsigned int GetCameraEventStatus(at_u32 * camStatus);
```
"""
function GetCameraEventStatus(camStatus)
    @ccall libandor.GetCameraEventStatus(camStatus::Ptr{Cuint})::Cuint
end

"""
    GetCameraHandle(cameraIndex, cameraHandle)

### Prototype
```c
unsigned int GetCameraHandle(at_32 cameraIndex, at_32 * cameraHandle);
```
"""
function GetCameraHandle(cameraIndex, cameraHandle)
    @ccall libandor.GetCameraHandle(cameraIndex::Cint, cameraHandle::Ptr{Cint})::Cuint
end

"""
    GetCameraInformation(index, information)

### Prototype
```c
unsigned int GetCameraInformation(int index, at_32 * information);
```
"""
function GetCameraInformation(index, information)
    @ccall libandor.GetCameraInformation(index::Cint, information::Ptr{Cint})::Cuint
end

"""
    GetCameraSerialNumber(number)

### Prototype
```c
unsigned int GetCameraSerialNumber(int * number);
```
"""
function GetCameraSerialNumber(number)
    @ccall libandor.GetCameraSerialNumber(number::Ptr{Cint})::Cuint
end

"""
    GetCapabilities(caps)

### Prototype
```c
unsigned int GetCapabilities(AndorCapabilities * caps);
```
"""
function GetCapabilities(caps)
    @ccall libandor.GetCapabilities(caps::Ptr{AndorCapabilities})::Cuint
end

"""
    GetControllerCardModel(controllerCardModel)

### Prototype
```c
unsigned int GetControllerCardModel(char * controllerCardModel);
```
"""
function GetControllerCardModel(controllerCardModel)
    @ccall libandor.GetControllerCardModel(controllerCardModel::Cstring)::Cuint
end

"""
    GetCountConvertWavelengthRange(minval, maxval)

### Prototype
```c
unsigned int GetCountConvertWavelengthRange(float * minval, float * maxval);
```
"""
function GetCountConvertWavelengthRange(minval, maxval)
    @ccall libandor.GetCountConvertWavelengthRange(minval::Ptr{Cfloat}, maxval::Ptr{Cfloat})::Cuint
end

"""
    GetCurrentCamera(cameraHandle)

### Prototype
```c
unsigned int GetCurrentCamera(at_32 * cameraHandle);
```
"""
function GetCurrentCamera(cameraHandle)
    @ccall libandor.GetCurrentCamera(cameraHandle::Ptr{Cint})::Cuint
end

"""
    GetCYMGShift(iXshift, iYShift)

### Prototype
```c
unsigned int GetCYMGShift(int * iXshift, int * iYShift);
```
"""
function GetCYMGShift(iXshift, iYShift)
    @ccall libandor.GetCYMGShift(iXshift::Ptr{Cint}, iYShift::Ptr{Cint})::Cuint
end

"""
    GetDDGExternalOutputEnabled(uiIndex, puiEnabled)

### Prototype
```c
unsigned int GetDDGExternalOutputEnabled(at_u32 uiIndex, at_u32 * puiEnabled);
```
"""
function GetDDGExternalOutputEnabled(uiIndex, puiEnabled)
    @ccall libandor.GetDDGExternalOutputEnabled(uiIndex::Cuint, puiEnabled::Ptr{Cuint})::Cuint
end

"""
    GetDDGExternalOutputPolarity(uiIndex, puiPolarity)

### Prototype
```c
unsigned int GetDDGExternalOutputPolarity(at_u32 uiIndex, at_u32 * puiPolarity);
```
"""
function GetDDGExternalOutputPolarity(uiIndex, puiPolarity)
    @ccall libandor.GetDDGExternalOutputPolarity(uiIndex::Cuint, puiPolarity::Ptr{Cuint})::Cuint
end

"""
    GetDDGExternalOutputStepEnabled(uiIndex, puiEnabled)

### Prototype
```c
unsigned int GetDDGExternalOutputStepEnabled(at_u32 uiIndex, at_u32 * puiEnabled);
```
"""
function GetDDGExternalOutputStepEnabled(uiIndex, puiEnabled)
    @ccall libandor.GetDDGExternalOutputStepEnabled(uiIndex::Cuint, puiEnabled::Ptr{Cuint})::Cuint
end

"""
    GetDDGExternalOutputTime(uiIndex, puiDelay, puiWidth)

### Prototype
```c
unsigned int GetDDGExternalOutputTime(at_u32 uiIndex, at_u64 * puiDelay, at_u64 * puiWidth);
```
"""
function GetDDGExternalOutputTime(uiIndex, puiDelay, puiWidth)
    @ccall libandor.GetDDGExternalOutputTime(uiIndex::Cuint, puiDelay::Ptr{Culonglong}, puiWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGTTLGateWidth(opticalWidth, ttlWidth)

### Prototype
```c
unsigned int GetDDGTTLGateWidth(at_u64 opticalWidth, at_u64 * ttlWidth);
```
"""
function GetDDGTTLGateWidth(opticalWidth, ttlWidth)
    @ccall libandor.GetDDGTTLGateWidth(opticalWidth::Culonglong, ttlWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGGateTime(puiDelay, puiWidth)

### Prototype
```c
unsigned int GetDDGGateTime(at_u64 * puiDelay, at_u64 * puiWidth);
```
"""
function GetDDGGateTime(puiDelay, puiWidth)
    @ccall libandor.GetDDGGateTime(puiDelay::Ptr{Culonglong}, puiWidth::Ptr{Culonglong})::Cuint
end

"""
    GetDDGInsertionDelay(piState)

### Prototype
```c
unsigned int GetDDGInsertionDelay(int * piState);
```
"""
function GetDDGInsertionDelay(piState)
    @ccall libandor.GetDDGInsertionDelay(piState::Ptr{Cint})::Cuint
end

"""
    GetDDGIntelligate(piState)

### Prototype
```c
unsigned int GetDDGIntelligate(int * piState);
```
"""
function GetDDGIntelligate(piState)
    @ccall libandor.GetDDGIntelligate(piState::Ptr{Cint})::Cuint
end

"""
    GetDDGIOC(state)

### Prototype
```c
unsigned int GetDDGIOC(int * state);
```
"""
function GetDDGIOC(state)
    @ccall libandor.GetDDGIOC(state::Ptr{Cint})::Cuint
end

"""
    GetDDGIOCFrequency(frequency)

### Prototype
```c
unsigned int GetDDGIOCFrequency(double * frequency);
```
"""
function GetDDGIOCFrequency(frequency)
    @ccall libandor.GetDDGIOCFrequency(frequency::Ptr{Cdouble})::Cuint
end

"""
    GetDDGIOCNumber(numberPulses)

### Prototype
```c
unsigned int GetDDGIOCNumber(unsigned long * numberPulses);
```
"""
function GetDDGIOCNumber(numberPulses)
    @ccall libandor.GetDDGIOCNumber(numberPulses::Ptr{Culong})::Cuint
end

"""
    GetDDGIOCNumberRequested(pulses)

### Prototype
```c
unsigned int GetDDGIOCNumberRequested(at_u32 * pulses);
```
"""
function GetDDGIOCNumberRequested(pulses)
    @ccall libandor.GetDDGIOCNumberRequested(pulses::Ptr{Cuint})::Cuint
end

"""
    GetDDGIOCPeriod(period)

### Prototype
```c
unsigned int GetDDGIOCPeriod(at_u64 * period);
```
"""
function GetDDGIOCPeriod(period)
    @ccall libandor.GetDDGIOCPeriod(period::Ptr{Culonglong})::Cuint
end

"""
    GetDDGIOCPulses(pulses)

### Prototype
```c
unsigned int GetDDGIOCPulses(int * pulses);
```
"""
function GetDDGIOCPulses(pulses)
    @ccall libandor.GetDDGIOCPulses(pulses::Ptr{Cint})::Cuint
end

"""
    GetDDGIOCTrigger(trigger)

### Prototype
```c
unsigned int GetDDGIOCTrigger(at_u32 * trigger);
```
"""
function GetDDGIOCTrigger(trigger)
    @ccall libandor.GetDDGIOCTrigger(trigger::Ptr{Cuint})::Cuint
end

"""
    GetDDGOpticalWidthEnabled(puiEnabled)

### Prototype
```c
unsigned int GetDDGOpticalWidthEnabled(at_u32 * puiEnabled);
```
"""
function GetDDGOpticalWidthEnabled(puiEnabled)
    @ccall libandor.GetDDGOpticalWidthEnabled(puiEnabled::Ptr{Cuint})::Cuint
end

"""
    GetDDGLiteGlobalControlByte(control)

### Prototype
```c
unsigned int GetDDGLiteGlobalControlByte(unsigned char * control);
```
"""
function GetDDGLiteGlobalControlByte(control)
    @ccall libandor.GetDDGLiteGlobalControlByte(control::Ptr{Cuchar})::Cuint
end

"""
    GetDDGLiteControlByte(channel, control)

### Prototype
```c
unsigned int GetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char * control);
```
"""
function GetDDGLiteControlByte(channel, control)
    @ccall libandor.GetDDGLiteControlByte(channel::AT_DDGLiteChannelId, control::Ptr{Cuchar})::Cuint
end

"""
    GetDDGLiteInitialDelay(channel, fDelay)

### Prototype
```c
unsigned int GetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float * fDelay);
```
"""
function GetDDGLiteInitialDelay(channel, fDelay)
    @ccall libandor.GetDDGLiteInitialDelay(channel::AT_DDGLiteChannelId, fDelay::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLitePulseWidth(channel, fWidth)

### Prototype
```c
unsigned int GetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float * fWidth);
```
"""
function GetDDGLitePulseWidth(channel, fWidth)
    @ccall libandor.GetDDGLitePulseWidth(channel::AT_DDGLiteChannelId, fWidth::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLiteInterPulseDelay(channel, fDelay)

### Prototype
```c
unsigned int GetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float * fDelay);
```
"""
function GetDDGLiteInterPulseDelay(channel, fDelay)
    @ccall libandor.GetDDGLiteInterPulseDelay(channel::AT_DDGLiteChannelId, fDelay::Ptr{Cfloat})::Cuint
end

"""
    GetDDGLitePulsesPerExposure(channel, ui32Pulses)

### Prototype
```c
unsigned int GetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, at_u32 * ui32Pulses);
```
"""
function GetDDGLitePulsesPerExposure(channel, ui32Pulses)
    @ccall libandor.GetDDGLitePulsesPerExposure(channel::AT_DDGLiteChannelId, ui32Pulses::Ptr{Cuint})::Cuint
end

"""
    GetDDGPulse(wid, resolution, Delay, Width)

### Prototype
```c
unsigned int GetDDGPulse(double wid, double resolution, double * Delay, double * Width);
```
"""
function GetDDGPulse(wid, resolution, Delay, Width)
    @ccall libandor.GetDDGPulse(wid::Cdouble, resolution::Cdouble, Delay::Ptr{Cdouble}, Width::Ptr{Cdouble})::Cuint
end

"""
    GetDDGStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int GetDDGStepCoefficients(at_u32 mode, double * p1, double * p2);
```
"""
function GetDDGStepCoefficients(mode, p1, p2)
    @ccall libandor.GetDDGStepCoefficients(mode::Cuint, p1::Ptr{Cdouble}, p2::Ptr{Cdouble})::Cuint
end

"""
    GetDDGWidthStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int GetDDGWidthStepCoefficients(at_u32 mode, double * p1, double * p2);
```
"""
function GetDDGWidthStepCoefficients(mode, p1, p2)
    @ccall libandor.GetDDGWidthStepCoefficients(mode::Cuint, p1::Ptr{Cdouble}, p2::Ptr{Cdouble})::Cuint
end

"""
    GetDDGStepMode(mode)

### Prototype
```c
unsigned int GetDDGStepMode(at_u32 * mode);
```
"""
function GetDDGStepMode(mode)
    @ccall libandor.GetDDGStepMode(mode::Ptr{Cuint})::Cuint
end

"""
    GetDDGWidthStepMode(mode)

### Prototype
```c
unsigned int GetDDGWidthStepMode(at_u32 * mode);
```
"""
function GetDDGWidthStepMode(mode)
    @ccall libandor.GetDDGWidthStepMode(mode::Ptr{Cuint})::Cuint
end

"""
    GetDetector(xpixels, ypixels)

### Prototype
```c
unsigned int GetDetector(int * xpixels, int * ypixels);
```
"""
function GetDetector(xpixels, ypixels)
    @ccall libandor.GetDetector(xpixels::Ptr{Cint}, ypixels::Ptr{Cint})::Cuint
end

"""
    GetDICameraInfo(info)

### Prototype
```c
unsigned int GetDICameraInfo(void * info);
```
"""
function GetDICameraInfo(info)
    @ccall libandor.GetDICameraInfo(info::Ptr{Cvoid})::Cuint
end

"""
    GetEMAdvanced(state)

### Prototype
```c
unsigned int GetEMAdvanced(int * state);
```
"""
function GetEMAdvanced(state)
    @ccall libandor.GetEMAdvanced(state::Ptr{Cint})::Cuint
end

"""
    GetEMCCDGain(gain)

### Prototype
```c
unsigned int GetEMCCDGain(int * gain);
```
"""
function GetEMCCDGain(gain)
    @ccall libandor.GetEMCCDGain(gain::Ptr{Cint})::Cuint
end

"""
    GetEMGainRange(low, high)

### Prototype
```c
unsigned int GetEMGainRange(int * low, int * high);
```
"""
function GetEMGainRange(low, high)
    @ccall libandor.GetEMGainRange(low::Ptr{Cint}, high::Ptr{Cint})::Cuint
end

"""
    GetESDEventStatus(camStatus)

### Prototype
```c
unsigned int GetESDEventStatus(at_u32 * camStatus);
```
"""
function GetESDEventStatus(camStatus)
    @ccall libandor.GetESDEventStatus(camStatus::Ptr{Cuint})::Cuint
end

"""
    GetExternalTriggerTermination(puiTermination)

### Prototype
```c
unsigned int GetExternalTriggerTermination(at_u32 * puiTermination);
```
"""
function GetExternalTriggerTermination(puiTermination)
    @ccall libandor.GetExternalTriggerTermination(puiTermination::Ptr{Cuint})::Cuint
end

"""
    GetFastestRecommendedVSSpeed(index, speed)

### Prototype
```c
unsigned int GetFastestRecommendedVSSpeed(int * index, float * speed);
```
"""
function GetFastestRecommendedVSSpeed(index, speed)
    @ccall libandor.GetFastestRecommendedVSSpeed(index::Ptr{Cint}, speed::Ptr{Cfloat})::Cuint
end

"""
    GetFIFOUsage(FIFOusage)

### Prototype
```c
unsigned int GetFIFOUsage(int * FIFOusage);
```
"""
function GetFIFOUsage(FIFOusage)
    @ccall libandor.GetFIFOUsage(FIFOusage::Ptr{Cint})::Cuint
end

"""
    GetFilterMode(mode)

### Prototype
```c
unsigned int GetFilterMode(int * mode);
```
"""
function GetFilterMode(mode)
    @ccall libandor.GetFilterMode(mode::Ptr{Cint})::Cuint
end

"""
    GetFKExposureTime(time)

### Prototype
```c
unsigned int GetFKExposureTime(float * time);
```
"""
function GetFKExposureTime(time)
    @ccall libandor.GetFKExposureTime(time::Ptr{Cfloat})::Cuint
end

"""
    GetFKVShiftSpeed(index, speed)

### Prototype
```c
unsigned int GetFKVShiftSpeed(int index, int * speed);
```
"""
function GetFKVShiftSpeed(index, speed)
    @ccall libandor.GetFKVShiftSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetFKVShiftSpeedF(index, speed)

### Prototype
```c
unsigned int GetFKVShiftSpeedF(int index, float * speed);
```
"""
function GetFKVShiftSpeedF(index, speed)
    @ccall libandor.GetFKVShiftSpeedF(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetFrontEndStatus(piFlag)

### Prototype
```c
unsigned int GetFrontEndStatus(int * piFlag);
```
"""
function GetFrontEndStatus(piFlag)
    @ccall libandor.GetFrontEndStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetGateMode(piGatemode)

### Prototype
```c
unsigned int GetGateMode(int * piGatemode);
```
"""
function GetGateMode(piGatemode)
    @ccall libandor.GetGateMode(piGatemode::Ptr{Cint})::Cuint
end

"""
    GetHardwareVersion(PCB, Decode, dummy1, dummy2, CameraFirmwareVersion, CameraFirmwareBuild)

### Prototype
```c
unsigned int GetHardwareVersion(unsigned int * PCB, unsigned int * Decode, unsigned int * dummy1, unsigned int * dummy2, unsigned int * CameraFirmwareVersion, unsigned int * CameraFirmwareBuild);
```
"""
function GetHardwareVersion(PCB, Decode, dummy1, dummy2, CameraFirmwareVersion, CameraFirmwareBuild)
    @ccall libandor.GetHardwareVersion(PCB::Ptr{Cuint}, Decode::Ptr{Cuint}, dummy1::Ptr{Cuint}, dummy2::Ptr{Cuint}, CameraFirmwareVersion::Ptr{Cuint}, CameraFirmwareBuild::Ptr{Cuint})::Cuint
end

"""
    GetHeadModel(name)

### Prototype
```c
unsigned int GetHeadModel(char * name);
```
"""
function GetHeadModel(name)
    @ccall libandor.GetHeadModel(name::Cstring)::Cuint
end

"""
    GetHorizontalSpeed(index, speed)

### Prototype
```c
unsigned int GetHorizontalSpeed(int index, int * speed);
```
"""
function GetHorizontalSpeed(index, speed)
    @ccall libandor.GetHorizontalSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetHSSpeed(channel, typ, index, speed)

### Prototype
```c
unsigned int GetHSSpeed(int channel, int typ, int index, float * speed);
```
"""
function GetHSSpeed(channel, typ, index, speed)
    @ccall libandor.GetHSSpeed(channel::Cint, typ::Cint, index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GetHVflag(bFlag)

### Prototype
```c
unsigned int GetHVflag(int * bFlag);
```
"""
function GetHVflag(bFlag)
    @ccall libandor.GetHVflag(bFlag::Ptr{Cint})::Cuint
end

"""
    GetID(devNum, id)

### Prototype
```c
unsigned int GetID(int devNum, int * id);
```
"""
function GetID(devNum, id)
    @ccall libandor.GetID(devNum::Cint, id::Ptr{Cint})::Cuint
end

"""
    GetImageFlip(iHFlip, iVFlip)

### Prototype
```c
unsigned int GetImageFlip(int * iHFlip, int * iVFlip);
```
"""
function GetImageFlip(iHFlip, iVFlip)
    @ccall libandor.GetImageFlip(iHFlip::Ptr{Cint}, iVFlip::Ptr{Cint})::Cuint
end

"""
    GetImageRotate(iRotate)

### Prototype
```c
unsigned int GetImageRotate(int * iRotate);
```
"""
function GetImageRotate(iRotate)
    @ccall libandor.GetImageRotate(iRotate::Ptr{Cint})::Cuint
end

"""
    GetImages(first, last, arr, size, validfirst, validlast)

### Prototype
```c
unsigned int GetImages(at_32 first, at_32 last, at_32 * arr, at_u32 size, at_32 * validfirst, at_32 * validlast);
```
"""
function GetImages(first, last, arr, size, validfirst, validlast)
    @ccall libandor.GetImages(first::Cint, last::Cint, arr::Ptr{Cint}, size::Cuint, validfirst::Ptr{Cint}, validlast::Ptr{Cint})::Cuint
end

"""
    GetImages16(first, last, arr, size, validfirst, validlast)

### Prototype
```c
unsigned int GetImages16(at_32 first, at_32 last, unsigned short * arr, at_u32 size, at_32 * validfirst, at_32 * validlast);
```
"""
function GetImages16(first, last, arr, size, validfirst, validlast)
    @ccall libandor.GetImages16(first::Cint, last::Cint, arr::Ptr{Cushort}, size::Cuint, validfirst::Ptr{Cint}, validlast::Ptr{Cint})::Cuint
end

"""
    GetImagesPerDMA(images)

### Prototype
```c
unsigned int GetImagesPerDMA(at_u32 * images);
```
"""
function GetImagesPerDMA(images)
    @ccall libandor.GetImagesPerDMA(images::Ptr{Cuint})::Cuint
end

"""
    GetIRQ(IRQ)

### Prototype
```c
unsigned int GetIRQ(int * IRQ);
```
"""
function GetIRQ(IRQ)
    @ccall libandor.GetIRQ(IRQ::Ptr{Cint})::Cuint
end

"""
    GetKeepCleanTime(KeepCleanTime)

### Prototype
```c
unsigned int GetKeepCleanTime(float * KeepCleanTime);
```
"""
function GetKeepCleanTime(KeepCleanTime)
    @ccall libandor.GetKeepCleanTime(KeepCleanTime::Ptr{Cfloat})::Cuint
end

"""
    GetMaximumBinning(ReadMode, HorzVert, MaxBinning)

### Prototype
```c
unsigned int GetMaximumBinning(int ReadMode, int HorzVert, int * MaxBinning);
```
"""
function GetMaximumBinning(ReadMode, HorzVert, MaxBinning)
    @ccall libandor.GetMaximumBinning(ReadMode::Cint, HorzVert::Cint, MaxBinning::Ptr{Cint})::Cuint
end

"""
    GetMaximumExposure(MaxExp)

### Prototype
```c
unsigned int GetMaximumExposure(float * MaxExp);
```
"""
function GetMaximumExposure(MaxExp)
    @ccall libandor.GetMaximumExposure(MaxExp::Ptr{Cfloat})::Cuint
end

"""
    GetMaximumNumberRingExposureTimes(number)

### Prototype
```c
unsigned int GetMaximumNumberRingExposureTimes(int * number);
```
"""
function GetMaximumNumberRingExposureTimes(number)
    @ccall libandor.GetMaximumNumberRingExposureTimes(number::Ptr{Cint})::Cuint
end

"""
    GetMCPGain(piGain)

### Prototype
```c
unsigned int GetMCPGain(int * piGain);
```
"""
function GetMCPGain(piGain)
    @ccall libandor.GetMCPGain(piGain::Ptr{Cint})::Cuint
end

"""
    GetMCPGainRange(iLow, iHigh)

### Prototype
```c
unsigned int GetMCPGainRange(int * iLow, int * iHigh);
```
"""
function GetMCPGainRange(iLow, iHigh)
    @ccall libandor.GetMCPGainRange(iLow::Ptr{Cint}, iHigh::Ptr{Cint})::Cuint
end

"""
    GetMCPGainTable(iNum, piGain, pfPhotoepc)

### Prototype
```c
unsigned int GetMCPGainTable(int iNum, int * piGain, float * pfPhotoepc);
```
"""
function GetMCPGainTable(iNum, piGain, pfPhotoepc)
    @ccall libandor.GetMCPGainTable(iNum::Cint, piGain::Ptr{Cint}, pfPhotoepc::Ptr{Cfloat})::Cuint
end

"""
    GetMCPVoltage(iVoltage)

### Prototype
```c
unsigned int GetMCPVoltage(int * iVoltage);
```
"""
function GetMCPVoltage(iVoltage)
    @ccall libandor.GetMCPVoltage(iVoltage::Ptr{Cint})::Cuint
end

"""
    GetMinimumImageLength(MinImageLength)

### Prototype
```c
unsigned int GetMinimumImageLength(int * MinImageLength);
```
"""
function GetMinimumImageLength(MinImageLength)
    @ccall libandor.GetMinimumImageLength(MinImageLength::Ptr{Cint})::Cuint
end

"""
    GetMinimumNumberInSeries(number)

### Prototype
```c
unsigned int GetMinimumNumberInSeries(int * number);
```
"""
function GetMinimumNumberInSeries(number)
    @ccall libandor.GetMinimumNumberInSeries(number::Ptr{Cint})::Cuint
end

"""
    GetMostRecentColorImage16(size, algorithm, red, green, blue)

### Prototype
```c
unsigned int GetMostRecentColorImage16(at_u32 size, int algorithm, unsigned short * red, unsigned short * green, unsigned short * blue);
```
"""
function GetMostRecentColorImage16(size, algorithm, red, green, blue)
    @ccall libandor.GetMostRecentColorImage16(size::Cuint, algorithm::Cint, red::Ptr{Cushort}, green::Ptr{Cushort}, blue::Ptr{Cushort})::Cuint
end

"""
    GetMostRecentImage(arr, size)

### Prototype
```c
unsigned int GetMostRecentImage(at_32 * arr, at_u32 size);
```
"""
function GetMostRecentImage(arr, size)
    @ccall libandor.GetMostRecentImage(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetMostRecentImage16(arr, size)

### Prototype
```c
unsigned int GetMostRecentImage16(unsigned short * arr, at_u32 size);
```
"""
function GetMostRecentImage16(arr, size)
    @ccall libandor.GetMostRecentImage16(arr::Ptr{Cushort}, size::Cuint)::Cuint
end

"""
    GetMetaDataInfo(TimeOfStart, pfTimeFromStart, index)

### Prototype
```c
unsigned int GetMetaDataInfo(SYSTEMTIME * TimeOfStart, float * pfTimeFromStart, unsigned int index);
```
"""
function GetMetaDataInfo(TimeOfStart, pfTimeFromStart, index)
    @ccall libandor.GetMetaDataInfo(TimeOfStart::Ptr{SYSTEMTIME}, pfTimeFromStart::Ptr{Cfloat}, index::Cuint)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:251:14, please use with caution
"""
    GetMSTimingsEnabled()

### Prototype
```c
unsigned int GetMSTimingsEnabled();
```
"""
function GetMSTimingsEnabled()
    @ccall libandor.GetMSTimingsEnabled()::Cuint
end

"""
    GetNewData(arr, size)

### Prototype
```c
unsigned int GetNewData(at_32 * arr, at_u32 size);
```
"""
function GetNewData(arr, size)
    @ccall libandor.GetNewData(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetNewData16(arr, size)

### Prototype
```c
unsigned int GetNewData16(unsigned short * arr, at_u32 size);
```
"""
function GetNewData16(arr, size)
    @ccall libandor.GetNewData16(arr::Ptr{Cushort}, size::Cuint)::Cuint
end

"""
    GetNewData8(arr, size)

### Prototype
```c
unsigned int GetNewData8(unsigned char * arr, at_u32 size);
```
"""
function GetNewData8(arr, size)
    @ccall libandor.GetNewData8(arr::Ptr{Cuchar}, size::Cuint)::Cuint
end

"""
    GetNewFloatData(arr, size)

### Prototype
```c
unsigned int GetNewFloatData(float * arr, at_u32 size);
```
"""
function GetNewFloatData(arr, size)
    @ccall libandor.GetNewFloatData(arr::Ptr{Cfloat}, size::Cuint)::Cuint
end

"""
    GetNumberADChannels(channels)

### Prototype
```c
unsigned int GetNumberADChannels(int * channels);
```
"""
function GetNumberADChannels(channels)
    @ccall libandor.GetNumberADChannels(channels::Ptr{Cint})::Cuint
end

"""
    GetNumberAmp(amp)

### Prototype
```c
unsigned int GetNumberAmp(int * amp);
```
"""
function GetNumberAmp(amp)
    @ccall libandor.GetNumberAmp(amp::Ptr{Cint})::Cuint
end

"""
    GetNumberAvailableImages(first, last)

### Prototype
```c
unsigned int GetNumberAvailableImages(at_32 * first, at_32 * last);
```
"""
function GetNumberAvailableImages(first, last)
    @ccall libandor.GetNumberAvailableImages(first::Ptr{Cint}, last::Ptr{Cint})::Cuint
end

"""
    GetNumberDDGExternalOutputs(puiCount)

### Prototype
```c
unsigned int GetNumberDDGExternalOutputs(at_u32 * puiCount);
```
"""
function GetNumberDDGExternalOutputs(puiCount)
    @ccall libandor.GetNumberDDGExternalOutputs(puiCount::Ptr{Cuint})::Cuint
end

"""
    GetNumberDevices(numDevs)

### Prototype
```c
unsigned int GetNumberDevices(int * numDevs);
```
"""
function GetNumberDevices(numDevs)
    @ccall libandor.GetNumberDevices(numDevs::Ptr{Cint})::Cuint
end

"""
    GetNumberFKVShiftSpeeds(number)

### Prototype
```c
unsigned int GetNumberFKVShiftSpeeds(int * number);
```
"""
function GetNumberFKVShiftSpeeds(number)
    @ccall libandor.GetNumberFKVShiftSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberHorizontalSpeeds(number)

### Prototype
```c
unsigned int GetNumberHorizontalSpeeds(int * number);
```
"""
function GetNumberHorizontalSpeeds(number)
    @ccall libandor.GetNumberHorizontalSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberHSSpeeds(channel, typ, speeds)

### Prototype
```c
unsigned int GetNumberHSSpeeds(int channel, int typ, int * speeds);
```
"""
function GetNumberHSSpeeds(channel, typ, speeds)
    @ccall libandor.GetNumberHSSpeeds(channel::Cint, typ::Cint, speeds::Ptr{Cint})::Cuint
end

"""
    GetNumberMissedExternalTriggers(first, last, arr, size)

### Prototype
```c
unsigned int GetNumberMissedExternalTriggers(unsigned int first, unsigned int last, unsigned short * arr, unsigned int size);
```
"""
function GetNumberMissedExternalTriggers(first, last, arr, size)
    @ccall libandor.GetNumberMissedExternalTriggers(first::Cuint, last::Cuint, arr::Ptr{Cushort}, size::Cuint)::Cuint
end

"""
    GetIRIGData(_uc_irigData, _ui_index)

### Prototype
```c
unsigned int GetIRIGData(unsigned char * _uc_irigData, unsigned int _ui_index);
```
"""
function GetIRIGData(_uc_irigData, _ui_index)
    @ccall libandor.GetIRIGData(_uc_irigData::Ptr{Cuchar}, _ui_index::Cuint)::Cuint
end

"""
    GetNumberNewImages(first, last)

### Prototype
```c
unsigned int GetNumberNewImages(at_32 * first, at_32 * last);
```
"""
function GetNumberNewImages(first, last)
    @ccall libandor.GetNumberNewImages(first::Ptr{Cint}, last::Ptr{Cint})::Cuint
end

"""
    GetNumberPhotonCountingDivisions(noOfDivisions)

### Prototype
```c
unsigned int GetNumberPhotonCountingDivisions(at_u32 * noOfDivisions);
```
"""
function GetNumberPhotonCountingDivisions(noOfDivisions)
    @ccall libandor.GetNumberPhotonCountingDivisions(noOfDivisions::Ptr{Cuint})::Cuint
end

"""
    GetNumberPreAmpGains(noGains)

### Prototype
```c
unsigned int GetNumberPreAmpGains(int * noGains);
```
"""
function GetNumberPreAmpGains(noGains)
    @ccall libandor.GetNumberPreAmpGains(noGains::Ptr{Cint})::Cuint
end

"""
    GetNumberRingExposureTimes(ipnumTimes)

### Prototype
```c
unsigned int GetNumberRingExposureTimes(int * ipnumTimes);
```
"""
function GetNumberRingExposureTimes(ipnumTimes)
    @ccall libandor.GetNumberRingExposureTimes(ipnumTimes::Ptr{Cint})::Cuint
end

"""
    GetNumberIO(iNumber)

### Prototype
```c
unsigned int GetNumberIO(int * iNumber);
```
"""
function GetNumberIO(iNumber)
    @ccall libandor.GetNumberIO(iNumber::Ptr{Cint})::Cuint
end

"""
    GetNumberVerticalSpeeds(number)

### Prototype
```c
unsigned int GetNumberVerticalSpeeds(int * number);
```
"""
function GetNumberVerticalSpeeds(number)
    @ccall libandor.GetNumberVerticalSpeeds(number::Ptr{Cint})::Cuint
end

"""
    GetNumberVSAmplitudes(number)

### Prototype
```c
unsigned int GetNumberVSAmplitudes(int * number);
```
"""
function GetNumberVSAmplitudes(number)
    @ccall libandor.GetNumberVSAmplitudes(number::Ptr{Cint})::Cuint
end

"""
    GetNumberVSSpeeds(speeds)

### Prototype
```c
unsigned int GetNumberVSSpeeds(int * speeds);
```
"""
function GetNumberVSSpeeds(speeds)
    @ccall libandor.GetNumberVSSpeeds(speeds::Ptr{Cint})::Cuint
end

"""
    GetOldestImage(arr, size)

### Prototype
```c
unsigned int GetOldestImage(at_32 * arr, at_u32 size);
```
"""
function GetOldestImage(arr, size)
    @ccall libandor.GetOldestImage(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    GetOldestImage16(arr, size)

### Prototype
```c
unsigned int GetOldestImage16(unsigned short * arr, at_u32 size);
```
"""
function GetOldestImage16(arr, size)
    @ccall libandor.GetOldestImage16(arr::Ptr{Cushort}, size::Cuint)::Cuint
end

"""
    GetPhosphorStatus(piFlag)

### Prototype
```c
unsigned int GetPhosphorStatus(int * piFlag);
```
"""
function GetPhosphorStatus(piFlag)
    @ccall libandor.GetPhosphorStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetPhysicalDMAAddress(Address1, Address2)

### Prototype
```c
unsigned int GetPhysicalDMAAddress(at_u32 * Address1, at_u32 * Address2);
```
"""
function GetPhysicalDMAAddress(Address1, Address2)
    @ccall libandor.GetPhysicalDMAAddress(Address1::Ptr{Cuint}, Address2::Ptr{Cuint})::Cuint
end

"""
    GetPixelSize(xSize, ySize)

### Prototype
```c
unsigned int GetPixelSize(float * xSize, float * ySize);
```
"""
function GetPixelSize(xSize, ySize)
    @ccall libandor.GetPixelSize(xSize::Ptr{Cfloat}, ySize::Ptr{Cfloat})::Cuint
end

"""
    GetPreAmpGain(index, gain)

### Prototype
```c
unsigned int GetPreAmpGain(int index, float * gain);
```
"""
function GetPreAmpGain(index, gain)
    @ccall libandor.GetPreAmpGain(index::Cint, gain::Ptr{Cfloat})::Cuint
end

"""
    GetPreAmpGainText(index, name, length)

### Prototype
```c
unsigned int GetPreAmpGainText(int index, char * name, int length);
```
"""
function GetPreAmpGainText(index, name, length)
    @ccall libandor.GetPreAmpGainText(index::Cint, name::Cstring, length::Cint)::Cuint
end

"""
    GetCurrentPreAmpGain(index, name, length)

### Prototype
```c
unsigned int GetCurrentPreAmpGain(int * index, char * name, int length);
```
"""
function GetCurrentPreAmpGain(index, name, length)
    @ccall libandor.GetCurrentPreAmpGain(index::Ptr{Cint}, name::Cstring, length::Cint)::Cuint
end

"""
    GetDualExposureTimes(exposure1, exposure2)

### Prototype
```c
unsigned int GetDualExposureTimes(float * exposure1, float * exposure2);
```
"""
function GetDualExposureTimes(exposure1, exposure2)
    @ccall libandor.GetDualExposureTimes(exposure1::Ptr{Cfloat}, exposure2::Ptr{Cfloat})::Cuint
end

"""
    GetQE(sensor, wavelength, mode, QE)

### Prototype
```c
unsigned int GetQE(char * sensor, float wavelength, unsigned int mode, float * QE);
```
"""
function GetQE(sensor, wavelength, mode, QE)
    @ccall libandor.GetQE(sensor::Cstring, wavelength::Cfloat, mode::Cuint, QE::Ptr{Cfloat})::Cuint
end

"""
    GetReadOutTime(ReadOutTime)

### Prototype
```c
unsigned int GetReadOutTime(float * ReadOutTime);
```
"""
function GetReadOutTime(ReadOutTime)
    @ccall libandor.GetReadOutTime(ReadOutTime::Ptr{Cfloat})::Cuint
end

"""
    GetRegisterDump(mode)

### Prototype
```c
unsigned int GetRegisterDump(int * mode);
```
"""
function GetRegisterDump(mode)
    @ccall libandor.GetRegisterDump(mode::Ptr{Cint})::Cuint
end

"""
    GetRelativeImageTimes(first, last, arr, size)

### Prototype
```c
unsigned int GetRelativeImageTimes(unsigned int first, unsigned int last, at_u64 * arr, unsigned int size);
```
"""
function GetRelativeImageTimes(first, last, arr, size)
    @ccall libandor.GetRelativeImageTimes(first::Cuint, last::Cuint, arr::Ptr{Culonglong}, size::Cuint)::Cuint
end

"""
    GetRingExposureRange(fpMin, fpMax)

### Prototype
```c
unsigned int GetRingExposureRange(float * fpMin, float * fpMax);
```
"""
function GetRingExposureRange(fpMin, fpMax)
    @ccall libandor.GetRingExposureRange(fpMin::Ptr{Cfloat}, fpMax::Ptr{Cfloat})::Cuint
end

"""
    GetSDK3Handle(Handle)

### Prototype
```c
unsigned int GetSDK3Handle(int * Handle);
```
"""
function GetSDK3Handle(Handle)
    @ccall libandor.GetSDK3Handle(Handle::Ptr{Cint})::Cuint
end

"""
    GetSensitivity(channel, horzShift, amplifier, pa, sensitivity)

### Prototype
```c
unsigned int GetSensitivity(int channel, int horzShift, int amplifier, int pa, float * sensitivity);
```
"""
function GetSensitivity(channel, horzShift, amplifier, pa, sensitivity)
    @ccall libandor.GetSensitivity(channel::Cint, horzShift::Cint, amplifier::Cint, pa::Cint, sensitivity::Ptr{Cfloat})::Cuint
end

"""
    GetShutterMinTimes(minclosingtime, minopeningtime)

### Prototype
```c
unsigned int GetShutterMinTimes(int * minclosingtime, int * minopeningtime);
```
"""
function GetShutterMinTimes(minclosingtime, minopeningtime)
    @ccall libandor.GetShutterMinTimes(minclosingtime::Ptr{Cint}, minopeningtime::Ptr{Cint})::Cuint
end

"""
    GetSizeOfCircularBuffer(index)

### Prototype
```c
unsigned int GetSizeOfCircularBuffer(at_32 * index);
```
"""
function GetSizeOfCircularBuffer(index)
    @ccall libandor.GetSizeOfCircularBuffer(index::Ptr{Cint})::Cuint
end

"""
    GetSlotBusDeviceFunction(dwslot, dwBus, dwDevice, dwFunction)

### Prototype
```c
unsigned int GetSlotBusDeviceFunction(at_u32 * dwslot, at_u32 * dwBus, at_u32 * dwDevice, at_u32 * dwFunction);
```
"""
function GetSlotBusDeviceFunction(dwslot, dwBus, dwDevice, dwFunction)
    @ccall libandor.GetSlotBusDeviceFunction(dwslot::Ptr{Cuint}, dwBus::Ptr{Cuint}, dwDevice::Ptr{Cuint}, dwFunction::Ptr{Cuint})::Cuint
end

"""
    GetSoftwareVersion(eprom, coffile, vxdrev, vxdver, dllrev, dllver)

### Prototype
```c
unsigned int GetSoftwareVersion(unsigned int * eprom, unsigned int * coffile, unsigned int * vxdrev, unsigned int * vxdver, unsigned int * dllrev, unsigned int * dllver);
```
"""
function GetSoftwareVersion(eprom, coffile, vxdrev, vxdver, dllrev, dllver)
    @ccall libandor.GetSoftwareVersion(eprom::Ptr{Cuint}, coffile::Ptr{Cuint}, vxdrev::Ptr{Cuint}, vxdver::Ptr{Cuint}, dllrev::Ptr{Cuint}, dllver::Ptr{Cuint})::Cuint
end

"""
    GetSpoolProgress(index)

### Prototype
```c
unsigned int GetSpoolProgress(at_32 * index);
```
"""
function GetSpoolProgress(index)
    @ccall libandor.GetSpoolProgress(index::Ptr{Cint})::Cuint
end

"""
    GetStartUpTime(time)

### Prototype
```c
unsigned int GetStartUpTime(float * time);
```
"""
function GetStartUpTime(time)
    @ccall libandor.GetStartUpTime(time::Ptr{Cfloat})::Cuint
end

"""
    GetStatus(status)

### Prototype
```c
unsigned int GetStatus(int * status);
```
"""
function GetStatus(status)
    @ccall libandor.GetStatus(status::Ptr{Cint})::Cuint
end

"""
    GetTECStatus(piFlag)

### Prototype
```c
unsigned int GetTECStatus(int * piFlag);
```
"""
function GetTECStatus(piFlag)
    @ccall libandor.GetTECStatus(piFlag::Ptr{Cint})::Cuint
end

"""
    GetTemperature(temperature)

### Prototype
```c
unsigned int GetTemperature(int * temperature);
```
"""
function GetTemperature(temperature)
    @ccall libandor.GetTemperature(temperature::Ptr{Cint})::Cuint
end

"""
    GetTemperatureF(temperature)

### Prototype
```c
unsigned int GetTemperatureF(float * temperature);
```
"""
function GetTemperatureF(temperature)
    @ccall libandor.GetTemperatureF(temperature::Ptr{Cfloat})::Cuint
end

"""
    GetTemperatureRange(mintemp, maxtemp)

### Prototype
```c
unsigned int GetTemperatureRange(int * mintemp, int * maxtemp);
```
"""
function GetTemperatureRange(mintemp, maxtemp)
    @ccall libandor.GetTemperatureRange(mintemp::Ptr{Cint}, maxtemp::Ptr{Cint})::Cuint
end

"""
    GetTemperaturePrecision(precision)

### Prototype
```c
unsigned int GetTemperaturePrecision(int * precision);
```
"""
function GetTemperaturePrecision(precision)
    @ccall libandor.GetTemperaturePrecision(precision::Ptr{Cint})::Cuint
end

"""
    GetTemperatureStatus(SensorTemp, TargetTemp, AmbientTemp, CoolerVolts)

### Prototype
```c
unsigned int GetTemperatureStatus(float * SensorTemp, float * TargetTemp, float * AmbientTemp, float * CoolerVolts);
```
"""
function GetTemperatureStatus(SensorTemp, TargetTemp, AmbientTemp, CoolerVolts)
    @ccall libandor.GetTemperatureStatus(SensorTemp::Ptr{Cfloat}, TargetTemp::Ptr{Cfloat}, AmbientTemp::Ptr{Cfloat}, CoolerVolts::Ptr{Cfloat})::Cuint
end

"""
    GetTotalNumberImagesAcquired(index)

### Prototype
```c
unsigned int GetTotalNumberImagesAcquired(at_32 * index);
```
"""
function GetTotalNumberImagesAcquired(index)
    @ccall libandor.GetTotalNumberImagesAcquired(index::Ptr{Cint})::Cuint
end

"""
    GetIODirection(index, iDirection)

### Prototype
```c
unsigned int GetIODirection(int index, int * iDirection);
```
"""
function GetIODirection(index, iDirection)
    @ccall libandor.GetIODirection(index::Cint, iDirection::Ptr{Cint})::Cuint
end

"""
    GetIOLevel(index, iLevel)

### Prototype
```c
unsigned int GetIOLevel(int index, int * iLevel);
```
"""
function GetIOLevel(index, iLevel)
    @ccall libandor.GetIOLevel(index::Cint, iLevel::Ptr{Cint})::Cuint
end

"""
    GetUSBDeviceDetails(VendorID, ProductID, FirmwareVersion, SpecificationNumber)

### Prototype
```c
unsigned int GetUSBDeviceDetails(unsigned short * VendorID, unsigned short * ProductID, unsigned short * FirmwareVersion, unsigned short * SpecificationNumber);
```
"""
function GetUSBDeviceDetails(VendorID, ProductID, FirmwareVersion, SpecificationNumber)
    @ccall libandor.GetUSBDeviceDetails(VendorID::Ptr{Cushort}, ProductID::Ptr{Cushort}, FirmwareVersion::Ptr{Cushort}, SpecificationNumber::Ptr{Cushort})::Cuint
end

"""
    GetVersionInfo(arr, szVersionInfo, ui32BufferLen)

### Prototype
```c
unsigned int GetVersionInfo(AT_VersionInfoId arr, char * szVersionInfo, at_u32 ui32BufferLen);
```
"""
function GetVersionInfo(arr, szVersionInfo, ui32BufferLen)
    @ccall libandor.GetVersionInfo(arr::AT_VersionInfoId, szVersionInfo::Cstring, ui32BufferLen::Cuint)::Cuint
end

"""
    GetVerticalSpeed(index, speed)

### Prototype
```c
unsigned int GetVerticalSpeed(int index, int * speed);
```
"""
function GetVerticalSpeed(index, speed)
    @ccall libandor.GetVerticalSpeed(index::Cint, speed::Ptr{Cint})::Cuint
end

"""
    GetVirtualDMAAddress(Address1, Address2)

### Prototype
```c
unsigned int GetVirtualDMAAddress(void ** Address1, void ** Address2);
```
"""
function GetVirtualDMAAddress(Address1, Address2)
    @ccall libandor.GetVirtualDMAAddress(Address1::Ptr{Ptr{Cvoid}}, Address2::Ptr{Ptr{Cvoid}})::Cuint
end

"""
    GetVSAmplitudeString(index, text)

### Prototype
```c
unsigned int GetVSAmplitudeString(int index, char * text);
```
"""
function GetVSAmplitudeString(index, text)
    @ccall libandor.GetVSAmplitudeString(index::Cint, text::Cstring)::Cuint
end

"""
    GetVSAmplitudeFromString(text, index)

### Prototype
```c
unsigned int GetVSAmplitudeFromString(char * text, int * index);
```
"""
function GetVSAmplitudeFromString(text, index)
    @ccall libandor.GetVSAmplitudeFromString(text::Cstring, index::Ptr{Cint})::Cuint
end

"""
    GetVSAmplitudeValue(index, value)

### Prototype
```c
unsigned int GetVSAmplitudeValue(int index, int * value);
```
"""
function GetVSAmplitudeValue(index, value)
    @ccall libandor.GetVSAmplitudeValue(index::Cint, value::Ptr{Cint})::Cuint
end

"""
    GetVSSpeed(index, speed)

### Prototype
```c
unsigned int GetVSSpeed(int index, float * speed);
```
"""
function GetVSSpeed(index, speed)
    @ccall libandor.GetVSSpeed(index::Cint, speed::Ptr{Cfloat})::Cuint
end

"""
    GPIBReceive(id, address, text, size)

### Prototype
```c
unsigned int GPIBReceive(int id, short address, char * text, int size);
```
"""
function GPIBReceive(id, address, text, size)
    @ccall libandor.GPIBReceive(id::Cint, address::Cshort, text::Cstring, size::Cint)::Cuint
end

"""
    GPIBSend(id, address, text)

### Prototype
```c
unsigned int GPIBSend(int id, short address, char * text);
```
"""
function GPIBSend(id, address, text)
    @ccall libandor.GPIBSend(id::Cint, address::Cshort, text::Cstring)::Cuint
end

"""
    I2CBurstRead(i2cAddress, nBytes, data)

### Prototype
```c
unsigned int I2CBurstRead(unsigned char i2cAddress, at_32 nBytes, unsigned char * data);
```
"""
function I2CBurstRead(i2cAddress, nBytes, data)
    @ccall libandor.I2CBurstRead(i2cAddress::Cuchar, nBytes::Cint, data::Ptr{Cuchar})::Cuint
end

"""
    I2CBurstWrite(i2cAddress, nBytes, data)

### Prototype
```c
unsigned int I2CBurstWrite(unsigned char i2cAddress, at_32 nBytes, unsigned char * data);
```
"""
function I2CBurstWrite(i2cAddress, nBytes, data)
    @ccall libandor.I2CBurstWrite(i2cAddress::Cuchar, nBytes::Cint, data::Ptr{Cuchar})::Cuint
end

"""
    I2CRead(deviceID, intAddress, pdata)

### Prototype
```c
unsigned int I2CRead(unsigned char deviceID, unsigned char intAddress, unsigned char * pdata);
```
"""
function I2CRead(deviceID, intAddress, pdata)
    @ccall libandor.I2CRead(deviceID::Cuchar, intAddress::Cuchar, pdata::Ptr{Cuchar})::Cuint
end

# no prototype is found for this function at atmcdLXd.h:319:14, please use with caution
"""
    I2CReset()

### Prototype
```c
unsigned int I2CReset();
```
"""
function I2CReset()
    @ccall libandor.I2CReset()::Cuint
end

"""
    I2CWrite(deviceID, intAddress, data)

### Prototype
```c
unsigned int I2CWrite(unsigned char deviceID, unsigned char intAddress, unsigned char data);
```
"""
function I2CWrite(deviceID, intAddress, data)
    @ccall libandor.I2CWrite(deviceID::Cuchar, intAddress::Cuchar, data::Cuchar)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:321:14, please use with caution
"""
    IdAndorDll()

### Prototype
```c
unsigned int IdAndorDll();
```
"""
function IdAndorDll()
    @ccall libandor.IdAndorDll()::Cuint
end

"""
    InAuxPort(port, state)

### Prototype
```c
unsigned int InAuxPort(int port, int * state);
```
"""
function InAuxPort(port, state)
    @ccall libandor.InAuxPort(port::Cint, state::Ptr{Cint})::Cuint
end

"""
    Initialize(dir)

### Prototype
```c
unsigned int Initialize(char * dir);
```
"""
function Initialize(dir)
    @ccall libandor.Initialize(dir::Cstring)::Cuint
end

"""
    InitializeDevice(dir)

### Prototype
```c
unsigned int InitializeDevice(char * dir);
```
"""
function InitializeDevice(dir)
    @ccall libandor.InitializeDevice(dir::Cstring)::Cuint
end

"""
    IsAmplifierAvailable(iamp)

### Prototype
```c
unsigned int IsAmplifierAvailable(int iamp);
```
"""
function IsAmplifierAvailable(iamp)
    @ccall libandor.IsAmplifierAvailable(iamp::Cint)::Cuint
end

"""
    IsCoolerOn(iCoolerStatus)

### Prototype
```c
unsigned int IsCoolerOn(int * iCoolerStatus);
```
"""
function IsCoolerOn(iCoolerStatus)
    @ccall libandor.IsCoolerOn(iCoolerStatus::Ptr{Cint})::Cuint
end

"""
    IsCountConvertModeAvailable(mode)

### Prototype
```c
unsigned int IsCountConvertModeAvailable(int mode);
```
"""
function IsCountConvertModeAvailable(mode)
    @ccall libandor.IsCountConvertModeAvailable(mode::Cint)::Cuint
end

"""
    IsInternalMechanicalShutter(InternalShutter)

### Prototype
```c
unsigned int IsInternalMechanicalShutter(int * InternalShutter);
```
"""
function IsInternalMechanicalShutter(InternalShutter)
    @ccall libandor.IsInternalMechanicalShutter(InternalShutter::Ptr{Cint})::Cuint
end

"""
    IsPreAmpGainAvailable(channel, amplifier, index, pa, status)

### Prototype
```c
unsigned int IsPreAmpGainAvailable(int channel, int amplifier, int index, int pa, int * status);
```
"""
function IsPreAmpGainAvailable(channel, amplifier, index, pa, status)
    @ccall libandor.IsPreAmpGainAvailable(channel::Cint, amplifier::Cint, index::Cint, pa::Cint, status::Ptr{Cint})::Cuint
end

"""
    IsReadoutFlippedByAmplifier(iAmplifier, iFlipped)

### Prototype
```c
unsigned int IsReadoutFlippedByAmplifier(int iAmplifier, int * iFlipped);
```
"""
function IsReadoutFlippedByAmplifier(iAmplifier, iFlipped)
    @ccall libandor.IsReadoutFlippedByAmplifier(iAmplifier::Cint, iFlipped::Ptr{Cint})::Cuint
end

"""
    IsTriggerModeAvailable(iTriggerMode)

### Prototype
```c
unsigned int IsTriggerModeAvailable(int iTriggerMode);
```
"""
function IsTriggerModeAvailable(iTriggerMode)
    @ccall libandor.IsTriggerModeAvailable(iTriggerMode::Cint)::Cuint
end

"""
    Merge(arr, nOrder, nPoint, nPixel, coeff, fit, hbin, output, start, step_Renamed)

### Prototype
```c
unsigned int Merge(const at_32 * arr, at_32 nOrder, at_32 nPoint, at_32 nPixel, float * coeff, at_32 fit, at_32 hbin, at_32 * output, float * start, float * step_Renamed);
```
"""
function Merge(arr, nOrder, nPoint, nPixel, coeff, fit, hbin, output, start, step_Renamed)
    @ccall libandor.Merge(arr::Ptr{Cint}, nOrder::Cint, nPoint::Cint, nPixel::Cint, coeff::Ptr{Cfloat}, fit::Cint, hbin::Cint, output::Ptr{Cint}, start::Ptr{Cfloat}, step_Renamed::Ptr{Cfloat})::Cuint
end

"""
    OutAuxPort(port, state)

### Prototype
```c
unsigned int OutAuxPort(int port, int state);
```
"""
function OutAuxPort(port, state)
    @ccall libandor.OutAuxPort(port::Cint, state::Cint)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:334:14, please use with caution
"""
    PrepareAcquisition()

### Prototype
```c
unsigned int PrepareAcquisition();
```
"""
function PrepareAcquisition()
    @ccall libandor.PrepareAcquisition()::Cuint
end

"""
    SaveAsBmp(path, palette, ymin, ymax)

### Prototype
```c
unsigned int SaveAsBmp(const char * path, const char * palette, at_32 ymin, at_32 ymax);
```
"""
function SaveAsBmp(path, palette, ymin, ymax)
    @ccall libandor.SaveAsBmp(path::Cstring, palette::Cstring, ymin::Cint, ymax::Cint)::Cuint
end

"""
    SaveAsCalibratedSif(path, x_data_type, x_unit, x_cal, rayleighWavelength)

### Prototype
```c
unsigned int SaveAsCalibratedSif(char * path, int x_data_type, int x_unit, float * x_cal, float rayleighWavelength);
```
"""
function SaveAsCalibratedSif(path, x_data_type, x_unit, x_cal, rayleighWavelength)
    @ccall libandor.SaveAsCalibratedSif(path::Cstring, x_data_type::Cint, x_unit::Cint, x_cal::Ptr{Cfloat}, rayleighWavelength::Cfloat)::Cuint
end

"""
    SaveAsCommentedSif(path, comment)

### Prototype
```c
unsigned int SaveAsCommentedSif(char * path, char * comment);
```
"""
function SaveAsCommentedSif(path, comment)
    @ccall libandor.SaveAsCommentedSif(path::Cstring, comment::Cstring)::Cuint
end

"""
    SaveAsEDF(szPath, iMode)

### Prototype
```c
unsigned int SaveAsEDF(char * szPath, int iMode);
```
"""
function SaveAsEDF(szPath, iMode)
    @ccall libandor.SaveAsEDF(szPath::Cstring, iMode::Cint)::Cuint
end

"""
    SaveAsFITS(szFileTitle, typ)

### Prototype
```c
unsigned int SaveAsFITS(char * szFileTitle, int typ);
```
"""
function SaveAsFITS(szFileTitle, typ)
    @ccall libandor.SaveAsFITS(szFileTitle::Cstring, typ::Cint)::Cuint
end

"""
    SaveAsRaw(szFileTitle, typ)

### Prototype
```c
unsigned int SaveAsRaw(char * szFileTitle, int typ);
```
"""
function SaveAsRaw(szFileTitle, typ)
    @ccall libandor.SaveAsRaw(szFileTitle::Cstring, typ::Cint)::Cuint
end

"""
    SaveAsSif(path)

### Prototype
```c
unsigned int SaveAsSif(char * path);
```
"""
function SaveAsSif(path)
    @ccall libandor.SaveAsSif(path::Cstring)::Cuint
end

"""
    SaveAsTiff(path, palette, position, typ)

### Prototype
```c
unsigned int SaveAsTiff(char * path, char * palette, int position, int typ);
```
"""
function SaveAsTiff(path, palette, position, typ)
    @ccall libandor.SaveAsTiff(path::Cstring, palette::Cstring, position::Cint, typ::Cint)::Cuint
end

"""
    SaveAsTiffEx(path, palette, position, typ, mode)

### Prototype
```c
unsigned int SaveAsTiffEx(char * path, char * palette, int position, int typ, int mode);
```
"""
function SaveAsTiffEx(path, palette, position, typ, mode)
    @ccall libandor.SaveAsTiffEx(path::Cstring, palette::Cstring, position::Cint, typ::Cint, mode::Cint)::Cuint
end

"""
    SaveEEPROMToFile(cFileName)

### Prototype
```c
unsigned int SaveEEPROMToFile(char * cFileName);
```
"""
function SaveEEPROMToFile(cFileName)
    @ccall libandor.SaveEEPROMToFile(cFileName::Cstring)::Cuint
end

"""
    SaveToClipBoard(palette)

### Prototype
```c
unsigned int SaveToClipBoard(char * palette);
```
"""
function SaveToClipBoard(palette)
    @ccall libandor.SaveToClipBoard(palette::Cstring)::Cuint
end

"""
    SelectDevice(devNum)

### Prototype
```c
unsigned int SelectDevice(int devNum);
```
"""
function SelectDevice(devNum)
    @ccall libandor.SelectDevice(devNum::Cint)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:348:14, please use with caution
"""
    SendSoftwareTrigger()

### Prototype
```c
unsigned int SendSoftwareTrigger();
```
"""
function SendSoftwareTrigger()
    @ccall libandor.SendSoftwareTrigger()::Cuint
end

"""
    SetAccumulationCycleTime(time)

### Prototype
```c
unsigned int SetAccumulationCycleTime(float time);
```
"""
function SetAccumulationCycleTime(time)
    @ccall libandor.SetAccumulationCycleTime(time::Cfloat)::Cuint
end

"""
    SetAcquisitionMode(mode)

### Prototype
```c
unsigned int SetAcquisitionMode(int mode);
```
"""
function SetAcquisitionMode(mode)
    @ccall libandor.SetAcquisitionMode(mode::Cint)::Cuint
end

"""
    SetSensorPortMode(mode)

### Prototype
```c
unsigned int SetSensorPortMode(int mode);
```
"""
function SetSensorPortMode(mode)
    @ccall libandor.SetSensorPortMode(mode::Cint)::Cuint
end

"""
    SelectSensorPort(port)

### Prototype
```c
unsigned int SelectSensorPort(int port);
```
"""
function SelectSensorPort(port)
    @ccall libandor.SelectSensorPort(port::Cint)::Cuint
end

"""
    SetSizeOfCircularBufferMegaBytes(sizeMB)

### Prototype
```c
unsigned int SetSizeOfCircularBufferMegaBytes(at_u32 sizeMB);
```
"""
function SetSizeOfCircularBufferMegaBytes(sizeMB)
    @ccall libandor.SetSizeOfCircularBufferMegaBytes(sizeMB::Cuint)::Cuint
end

"""
    SelectDualSensorPort(port)

### Prototype
```c
unsigned int SelectDualSensorPort(int port);
```
"""
function SelectDualSensorPort(port)
    @ccall libandor.SelectDualSensorPort(port::Cint)::Cuint
end

"""
    SetAcquisitionType(typ)

### Prototype
```c
unsigned int SetAcquisitionType(int typ);
```
"""
function SetAcquisitionType(typ)
    @ccall libandor.SetAcquisitionType(typ::Cint)::Cuint
end

"""
    SetADChannel(channel)

### Prototype
```c
unsigned int SetADChannel(int channel);
```
"""
function SetADChannel(channel)
    @ccall libandor.SetADChannel(channel::Cint)::Cuint
end

"""
    SetAdvancedTriggerModeState(iState)

### Prototype
```c
unsigned int SetAdvancedTriggerModeState(int iState);
```
"""
function SetAdvancedTriggerModeState(iState)
    @ccall libandor.SetAdvancedTriggerModeState(iState::Cint)::Cuint
end

"""
    SetBackground(arr, size)

### Prototype
```c
unsigned int SetBackground(at_32 * arr, at_u32 size);
```
"""
function SetBackground(arr, size)
    @ccall libandor.SetBackground(arr::Ptr{Cint}, size::Cuint)::Cuint
end

"""
    SetBaselineClamp(state)

### Prototype
```c
unsigned int SetBaselineClamp(int state);
```
"""
function SetBaselineClamp(state)
    @ccall libandor.SetBaselineClamp(state::Cint)::Cuint
end

"""
    SetBaselineOffset(offset)

### Prototype
```c
unsigned int SetBaselineOffset(int offset);
```
"""
function SetBaselineOffset(offset)
    @ccall libandor.SetBaselineOffset(offset::Cint)::Cuint
end

"""
    SetBitsPerPixel(state)

### Prototype
```c
unsigned int SetBitsPerPixel(int state);
```
"""
function SetBitsPerPixel(state)
    @ccall libandor.SetBitsPerPixel(state::Cint)::Cuint
end

"""
    SetCameraLinkMode(mode)

### Prototype
```c
unsigned int SetCameraLinkMode(int mode);
```
"""
function SetCameraLinkMode(mode)
    @ccall libandor.SetCameraLinkMode(mode::Cint)::Cuint
end

"""
    SetCameraStatusEnable(Enable)

### Prototype
```c
unsigned int SetCameraStatusEnable(unsigned long Enable);
```
"""
function SetCameraStatusEnable(Enable)
    @ccall libandor.SetCameraStatusEnable(Enable::Culong)::Cuint
end

"""
    SetChargeShifting(NumberRows, NumberRepeats)

### Prototype
```c
unsigned int SetChargeShifting(unsigned int NumberRows, unsigned int NumberRepeats);
```
"""
function SetChargeShifting(NumberRows, NumberRepeats)
    @ccall libandor.SetChargeShifting(NumberRows::Cuint, NumberRepeats::Cuint)::Cuint
end

"""
    SetComplexImage(numAreas, areas)

### Prototype
```c
unsigned int SetComplexImage(int numAreas, int * areas);
```
"""
function SetComplexImage(numAreas, areas)
    @ccall libandor.SetComplexImage(numAreas::Cint, areas::Ptr{Cint})::Cuint
end

"""
    SetCoolerMode(mode)

### Prototype
```c
unsigned int SetCoolerMode(int mode);
```
"""
function SetCoolerMode(mode)
    @ccall libandor.SetCoolerMode(mode::Cint)::Cuint
end

"""
    SetCountConvertMode(Mode)

### Prototype
```c
unsigned int SetCountConvertMode(int Mode);
```
"""
function SetCountConvertMode(Mode)
    @ccall libandor.SetCountConvertMode(Mode::Cint)::Cuint
end

"""
    SetCountConvertWavelength(wavelength)

### Prototype
```c
unsigned int SetCountConvertWavelength(float wavelength);
```
"""
function SetCountConvertWavelength(wavelength)
    @ccall libandor.SetCountConvertWavelength(wavelength::Cfloat)::Cuint
end

"""
    SetCropMode(active, cropHeight, reserved)

### Prototype
```c
unsigned int SetCropMode(int active, int cropHeight, int reserved);
```
"""
function SetCropMode(active, cropHeight, reserved)
    @ccall libandor.SetCropMode(active::Cint, cropHeight::Cint, reserved::Cint)::Cuint
end

"""
    SetCurrentCamera(cameraHandle)

### Prototype
```c
unsigned int SetCurrentCamera(at_32 cameraHandle);
```
"""
function SetCurrentCamera(cameraHandle)
    @ccall libandor.SetCurrentCamera(cameraHandle::Cint)::Cuint
end

"""
    SetCustomTrackHBin(bin)

### Prototype
```c
unsigned int SetCustomTrackHBin(int bin);
```
"""
function SetCustomTrackHBin(bin)
    @ccall libandor.SetCustomTrackHBin(bin::Cint)::Cuint
end

"""
    SetDataType(typ)

### Prototype
```c
unsigned int SetDataType(int typ);
```
"""
function SetDataType(typ)
    @ccall libandor.SetDataType(typ::Cint)::Cuint
end

"""
    SetDACOutput(iOption, iResolution, iValue)

### Prototype
```c
unsigned int SetDACOutput(int iOption, int iResolution, int iValue);
```
"""
function SetDACOutput(iOption, iResolution, iValue)
    @ccall libandor.SetDACOutput(iOption::Cint, iResolution::Cint, iValue::Cint)::Cuint
end

"""
    SetDACOutputScale(iScale)

### Prototype
```c
unsigned int SetDACOutputScale(int iScale);
```
"""
function SetDACOutputScale(iScale)
    @ccall libandor.SetDACOutputScale(iScale::Cint)::Cuint
end

"""
    SetDDGAddress(t0, t1, t2, t3, address)

### Prototype
```c
unsigned int SetDDGAddress(unsigned char t0, unsigned char t1, unsigned char t2, unsigned char t3, unsigned char address);
```
"""
function SetDDGAddress(t0, t1, t2, t3, address)
    @ccall libandor.SetDDGAddress(t0::Cuchar, t1::Cuchar, t2::Cuchar, t3::Cuchar, address::Cuchar)::Cuint
end

"""
    SetDDGExternalOutputEnabled(uiIndex, uiEnabled)

### Prototype
```c
unsigned int SetDDGExternalOutputEnabled(at_u32 uiIndex, at_u32 uiEnabled);
```
"""
function SetDDGExternalOutputEnabled(uiIndex, uiEnabled)
    @ccall libandor.SetDDGExternalOutputEnabled(uiIndex::Cuint, uiEnabled::Cuint)::Cuint
end

"""
    SetDDGExternalOutputPolarity(uiIndex, uiPolarity)

### Prototype
```c
unsigned int SetDDGExternalOutputPolarity(at_u32 uiIndex, at_u32 uiPolarity);
```
"""
function SetDDGExternalOutputPolarity(uiIndex, uiPolarity)
    @ccall libandor.SetDDGExternalOutputPolarity(uiIndex::Cuint, uiPolarity::Cuint)::Cuint
end

"""
    SetDDGExternalOutputStepEnabled(uiIndex, uiEnabled)

### Prototype
```c
unsigned int SetDDGExternalOutputStepEnabled(at_u32 uiIndex, at_u32 uiEnabled);
```
"""
function SetDDGExternalOutputStepEnabled(uiIndex, uiEnabled)
    @ccall libandor.SetDDGExternalOutputStepEnabled(uiIndex::Cuint, uiEnabled::Cuint)::Cuint
end

"""
    SetDDGExternalOutputTime(uiIndex, uiDelay, uiWidth)

### Prototype
```c
unsigned int SetDDGExternalOutputTime(at_u32 uiIndex, at_u64 uiDelay, at_u64 uiWidth);
```
"""
function SetDDGExternalOutputTime(uiIndex, uiDelay, uiWidth)
    @ccall libandor.SetDDGExternalOutputTime(uiIndex::Cuint, uiDelay::Culonglong, uiWidth::Culonglong)::Cuint
end

"""
    SetDDGGain(gain)

### Prototype
```c
unsigned int SetDDGGain(int gain);
```
"""
function SetDDGGain(gain)
    @ccall libandor.SetDDGGain(gain::Cint)::Cuint
end

"""
    SetDDGGateStep(step_Renamed)

### Prototype
```c
unsigned int SetDDGGateStep(double step_Renamed);
```
"""
function SetDDGGateStep(step_Renamed)
    @ccall libandor.SetDDGGateStep(step_Renamed::Cdouble)::Cuint
end

"""
    SetDDGGateTime(uiDelay, uiWidth)

### Prototype
```c
unsigned int SetDDGGateTime(at_u64 uiDelay, at_u64 uiWidth);
```
"""
function SetDDGGateTime(uiDelay, uiWidth)
    @ccall libandor.SetDDGGateTime(uiDelay::Culonglong, uiWidth::Culonglong)::Cuint
end

"""
    SetDDGInsertionDelay(state)

### Prototype
```c
unsigned int SetDDGInsertionDelay(int state);
```
"""
function SetDDGInsertionDelay(state)
    @ccall libandor.SetDDGInsertionDelay(state::Cint)::Cuint
end

"""
    SetDDGIntelligate(state)

### Prototype
```c
unsigned int SetDDGIntelligate(int state);
```
"""
function SetDDGIntelligate(state)
    @ccall libandor.SetDDGIntelligate(state::Cint)::Cuint
end

"""
    SetDDGIOC(state)

### Prototype
```c
unsigned int SetDDGIOC(int state);
```
"""
function SetDDGIOC(state)
    @ccall libandor.SetDDGIOC(state::Cint)::Cuint
end

"""
    SetDDGIOCFrequency(frequency)

### Prototype
```c
unsigned int SetDDGIOCFrequency(double frequency);
```
"""
function SetDDGIOCFrequency(frequency)
    @ccall libandor.SetDDGIOCFrequency(frequency::Cdouble)::Cuint
end

"""
    SetDDGIOCNumber(numberPulses)

### Prototype
```c
unsigned int SetDDGIOCNumber(unsigned long numberPulses);
```
"""
function SetDDGIOCNumber(numberPulses)
    @ccall libandor.SetDDGIOCNumber(numberPulses::Culong)::Cuint
end

"""
    SetDDGIOCPeriod(period)

### Prototype
```c
unsigned int SetDDGIOCPeriod(at_u64 period);
```
"""
function SetDDGIOCPeriod(period)
    @ccall libandor.SetDDGIOCPeriod(period::Culonglong)::Cuint
end

"""
    SetDDGIOCTrigger(trigger)

### Prototype
```c
unsigned int SetDDGIOCTrigger(at_u32 trigger);
```
"""
function SetDDGIOCTrigger(trigger)
    @ccall libandor.SetDDGIOCTrigger(trigger::Cuint)::Cuint
end

"""
    SetDDGOpticalWidthEnabled(uiEnabled)

### Prototype
```c
unsigned int SetDDGOpticalWidthEnabled(at_u32 uiEnabled);
```
"""
function SetDDGOpticalWidthEnabled(uiEnabled)
    @ccall libandor.SetDDGOpticalWidthEnabled(uiEnabled::Cuint)::Cuint
end

"""
    SetDDGLiteGlobalControlByte(control)

### Prototype
```c
unsigned int SetDDGLiteGlobalControlByte(unsigned char control);
```
"""
function SetDDGLiteGlobalControlByte(control)
    @ccall libandor.SetDDGLiteGlobalControlByte(control::Cuchar)::Cuint
end

"""
    SetDDGLiteControlByte(channel, control)

### Prototype
```c
unsigned int SetDDGLiteControlByte(AT_DDGLiteChannelId channel, unsigned char control);
```
"""
function SetDDGLiteControlByte(channel, control)
    @ccall libandor.SetDDGLiteControlByte(channel::AT_DDGLiteChannelId, control::Cuchar)::Cuint
end

"""
    SetDDGLiteInitialDelay(channel, fDelay)

### Prototype
```c
unsigned int SetDDGLiteInitialDelay(AT_DDGLiteChannelId channel, float fDelay);
```
"""
function SetDDGLiteInitialDelay(channel, fDelay)
    @ccall libandor.SetDDGLiteInitialDelay(channel::AT_DDGLiteChannelId, fDelay::Cfloat)::Cuint
end

"""
    SetDDGLitePulseWidth(channel, fWidth)

### Prototype
```c
unsigned int SetDDGLitePulseWidth(AT_DDGLiteChannelId channel, float fWidth);
```
"""
function SetDDGLitePulseWidth(channel, fWidth)
    @ccall libandor.SetDDGLitePulseWidth(channel::AT_DDGLiteChannelId, fWidth::Cfloat)::Cuint
end

"""
    SetDDGLiteInterPulseDelay(channel, fDelay)

### Prototype
```c
unsigned int SetDDGLiteInterPulseDelay(AT_DDGLiteChannelId channel, float fDelay);
```
"""
function SetDDGLiteInterPulseDelay(channel, fDelay)
    @ccall libandor.SetDDGLiteInterPulseDelay(channel::AT_DDGLiteChannelId, fDelay::Cfloat)::Cuint
end

"""
    SetDDGLitePulsesPerExposure(channel, ui32Pulses)

### Prototype
```c
unsigned int SetDDGLitePulsesPerExposure(AT_DDGLiteChannelId channel, at_u32 ui32Pulses);
```
"""
function SetDDGLitePulsesPerExposure(channel, ui32Pulses)
    @ccall libandor.SetDDGLitePulsesPerExposure(channel::AT_DDGLiteChannelId, ui32Pulses::Cuint)::Cuint
end

"""
    SetDDGStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int SetDDGStepCoefficients(at_u32 mode, double p1, double p2);
```
"""
function SetDDGStepCoefficients(mode, p1, p2)
    @ccall libandor.SetDDGStepCoefficients(mode::Cuint, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDDGWidthStepCoefficients(mode, p1, p2)

### Prototype
```c
unsigned int SetDDGWidthStepCoefficients(at_u32 mode, double p1, double p2);
```
"""
function SetDDGWidthStepCoefficients(mode, p1, p2)
    @ccall libandor.SetDDGWidthStepCoefficients(mode::Cuint, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDDGStepMode(mode)

### Prototype
```c
unsigned int SetDDGStepMode(at_u32 mode);
```
"""
function SetDDGStepMode(mode)
    @ccall libandor.SetDDGStepMode(mode::Cuint)::Cuint
end

"""
    SetDDGWidthStepMode(mode)

### Prototype
```c
unsigned int SetDDGWidthStepMode(at_u32 mode);
```
"""
function SetDDGWidthStepMode(mode)
    @ccall libandor.SetDDGWidthStepMode(mode::Cuint)::Cuint
end

"""
    SetDDGTimes(t0, t1, t2)

### Prototype
```c
unsigned int SetDDGTimes(double t0, double t1, double t2);
```
"""
function SetDDGTimes(t0, t1, t2)
    @ccall libandor.SetDDGTimes(t0::Cdouble, t1::Cdouble, t2::Cdouble)::Cuint
end

"""
    SetDDGTriggerMode(mode)

### Prototype
```c
unsigned int SetDDGTriggerMode(int mode);
```
"""
function SetDDGTriggerMode(mode)
    @ccall libandor.SetDDGTriggerMode(mode::Cint)::Cuint
end

"""
    SetDDGVariableGateStep(mode, p1, p2)

### Prototype
```c
unsigned int SetDDGVariableGateStep(int mode, double p1, double p2);
```
"""
function SetDDGVariableGateStep(mode, p1, p2)
    @ccall libandor.SetDDGVariableGateStep(mode::Cint, p1::Cdouble, p2::Cdouble)::Cuint
end

"""
    SetDelayGenerator(board, address, typ)

### Prototype
```c
unsigned int SetDelayGenerator(int board, short address, int typ);
```
"""
function SetDelayGenerator(board, address, typ)
    @ccall libandor.SetDelayGenerator(board::Cint, address::Cshort, typ::Cint)::Cuint
end

"""
    SetDMAParameters(MaxImagesPerDMA, SecondsPerDMA)

### Prototype
```c
unsigned int SetDMAParameters(int MaxImagesPerDMA, float SecondsPerDMA);
```
"""
function SetDMAParameters(MaxImagesPerDMA, SecondsPerDMA)
    @ccall libandor.SetDMAParameters(MaxImagesPerDMA::Cint, SecondsPerDMA::Cfloat)::Cuint
end

"""
    SetEMAdvanced(state)

### Prototype
```c
unsigned int SetEMAdvanced(int state);
```
"""
function SetEMAdvanced(state)
    @ccall libandor.SetEMAdvanced(state::Cint)::Cuint
end

"""
    SetEMCCDGain(gain)

### Prototype
```c
unsigned int SetEMCCDGain(int gain);
```
"""
function SetEMCCDGain(gain)
    @ccall libandor.SetEMCCDGain(gain::Cint)::Cuint
end

"""
    SetEMClockCompensation(EMClockCompensationFlag)

### Prototype
```c
unsigned int SetEMClockCompensation(int EMClockCompensationFlag);
```
"""
function SetEMClockCompensation(EMClockCompensationFlag)
    @ccall libandor.SetEMClockCompensation(EMClockCompensationFlag::Cint)::Cuint
end

"""
    SetEMGainMode(mode)

### Prototype
```c
unsigned int SetEMGainMode(int mode);
```
"""
function SetEMGainMode(mode)
    @ccall libandor.SetEMGainMode(mode::Cint)::Cuint
end

"""
    SetExposureTime(time)

### Prototype
```c
unsigned int SetExposureTime(float time);
```
"""
function SetExposureTime(time)
    @ccall libandor.SetExposureTime(time::Cfloat)::Cuint
end

"""
    SetExternalTriggerTermination(uiTermination)

### Prototype
```c
unsigned int SetExternalTriggerTermination(at_u32 uiTermination);
```
"""
function SetExternalTriggerTermination(uiTermination)
    @ccall libandor.SetExternalTriggerTermination(uiTermination::Cuint)::Cuint
end

"""
    SetFanMode(mode)

### Prototype
```c
unsigned int SetFanMode(int mode);
```
"""
function SetFanMode(mode)
    @ccall libandor.SetFanMode(mode::Cint)::Cuint
end

"""
    SetFastExtTrigger(mode)

### Prototype
```c
unsigned int SetFastExtTrigger(int mode);
```
"""
function SetFastExtTrigger(mode)
    @ccall libandor.SetFastExtTrigger(mode::Cint)::Cuint
end

"""
    SetFastKinetics(exposedRows, seriesLength, time, mode, hbin, vbin)

### Prototype
```c
unsigned int SetFastKinetics(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin);
```
"""
function SetFastKinetics(exposedRows, seriesLength, time, mode, hbin, vbin)
    @ccall libandor.SetFastKinetics(exposedRows::Cint, seriesLength::Cint, time::Cfloat, mode::Cint, hbin::Cint, vbin::Cint)::Cuint
end

"""
    SetFastKineticsEx(exposedRows, seriesLength, time, mode, hbin, vbin, offset)

### Prototype
```c
unsigned int SetFastKineticsEx(int exposedRows, int seriesLength, float time, int mode, int hbin, int vbin, int offset);
```
"""
function SetFastKineticsEx(exposedRows, seriesLength, time, mode, hbin, vbin, offset)
    @ccall libandor.SetFastKineticsEx(exposedRows::Cint, seriesLength::Cint, time::Cfloat, mode::Cint, hbin::Cint, vbin::Cint, offset::Cint)::Cuint
end

"""
    SetFastKineticsStorageMode(mode)

### Prototype
```c
unsigned int SetFastKineticsStorageMode(int mode);
```
"""
function SetFastKineticsStorageMode(mode)
    @ccall libandor.SetFastKineticsStorageMode(mode::Cint)::Cuint
end

"""
    SetFastKineticsTimeScanMode(rows, tracks, mode)

### Prototype
```c
unsigned int SetFastKineticsTimeScanMode(int rows, int tracks, int mode);
```
"""
function SetFastKineticsTimeScanMode(rows, tracks, mode)
    @ccall libandor.SetFastKineticsTimeScanMode(rows::Cint, tracks::Cint, mode::Cint)::Cuint
end

"""
    SetFilterMode(mode)

### Prototype
```c
unsigned int SetFilterMode(int mode);
```
"""
function SetFilterMode(mode)
    @ccall libandor.SetFilterMode(mode::Cint)::Cuint
end

"""
    SetFilterParameters(width, sensitivity, range, accept, smooth, noise)

### Prototype
```c
unsigned int SetFilterParameters(int width, float sensitivity, int range, float accept, int smooth, int noise);
```
"""
function SetFilterParameters(width, sensitivity, range, accept, smooth, noise)
    @ccall libandor.SetFilterParameters(width::Cint, sensitivity::Cfloat, range::Cint, accept::Cfloat, smooth::Cint, noise::Cint)::Cuint
end

"""
    SetFKVShiftSpeed(index)

### Prototype
```c
unsigned int SetFKVShiftSpeed(int index);
```
"""
function SetFKVShiftSpeed(index)
    @ccall libandor.SetFKVShiftSpeed(index::Cint)::Cuint
end

"""
    SetFPDP(state)

### Prototype
```c
unsigned int SetFPDP(int state);
```
"""
function SetFPDP(state)
    @ccall libandor.SetFPDP(state::Cint)::Cuint
end

"""
    SetFrameTransferMode(mode)

### Prototype
```c
unsigned int SetFrameTransferMode(int mode);
```
"""
function SetFrameTransferMode(mode)
    @ccall libandor.SetFrameTransferMode(mode::Cint)::Cuint
end

"""
    SetFullImage(hbin, vbin)

### Prototype
```c
unsigned int SetFullImage(int hbin, int vbin);
```
"""
function SetFullImage(hbin, vbin)
    @ccall libandor.SetFullImage(hbin::Cint, vbin::Cint)::Cuint
end

"""
    SetFVBHBin(bin)

### Prototype
```c
unsigned int SetFVBHBin(int bin);
```
"""
function SetFVBHBin(bin)
    @ccall libandor.SetFVBHBin(bin::Cint)::Cuint
end

"""
    SetGain(gain)

### Prototype
```c
unsigned int SetGain(int gain);
```
"""
function SetGain(gain)
    @ccall libandor.SetGain(gain::Cint)::Cuint
end

"""
    SetGate(delay, width, stepRenamed)

### Prototype
```c
unsigned int SetGate(float delay, float width, float stepRenamed);
```
"""
function SetGate(delay, width, stepRenamed)
    @ccall libandor.SetGate(delay::Cfloat, width::Cfloat, stepRenamed::Cfloat)::Cuint
end

"""
    SetGateMode(gatemode)

### Prototype
```c
unsigned int SetGateMode(int gatemode);
```
"""
function SetGateMode(gatemode)
    @ccall libandor.SetGateMode(gatemode::Cint)::Cuint
end

"""
    SetHighCapacity(state)

### Prototype
```c
unsigned int SetHighCapacity(int state);
```
"""
function SetHighCapacity(state)
    @ccall libandor.SetHighCapacity(state::Cint)::Cuint
end

"""
    SetHorizontalSpeed(index)

### Prototype
```c
unsigned int SetHorizontalSpeed(int index);
```
"""
function SetHorizontalSpeed(index)
    @ccall libandor.SetHorizontalSpeed(index::Cint)::Cuint
end

"""
    SetHSSpeed(typ, index)

### Prototype
```c
unsigned int SetHSSpeed(int typ, int index);
```
"""
function SetHSSpeed(typ, index)
    @ccall libandor.SetHSSpeed(typ::Cint, index::Cint)::Cuint
end

"""
    SetImage(hbin, vbin, hstart, hend, vstart, vend)

### Prototype
```c
unsigned int SetImage(int hbin, int vbin, int hstart, int hend, int vstart, int vend);
```
"""
function SetImage(hbin, vbin, hstart, hend, vstart, vend)
    @ccall libandor.SetImage(hbin::Cint, vbin::Cint, hstart::Cint, hend::Cint, vstart::Cint, vend::Cint)::Cuint
end

"""
    SetImageFlip(iHFlip, iVFlip)

### Prototype
```c
unsigned int SetImageFlip(int iHFlip, int iVFlip);
```
"""
function SetImageFlip(iHFlip, iVFlip)
    @ccall libandor.SetImageFlip(iHFlip::Cint, iVFlip::Cint)::Cuint
end

"""
    SetImageRotate(iRotate)

### Prototype
```c
unsigned int SetImageRotate(int iRotate);
```
"""
function SetImageRotate(iRotate)
    @ccall libandor.SetImageRotate(iRotate::Cint)::Cuint
end

"""
    SetIsolatedCropMode(active, cropheight, cropwidth, vbin, hbin)

### Prototype
```c
unsigned int SetIsolatedCropMode(int active, int cropheight, int cropwidth, int vbin, int hbin);
```
"""
function SetIsolatedCropMode(active, cropheight, cropwidth, vbin, hbin)
    @ccall libandor.SetIsolatedCropMode(active::Cint, cropheight::Cint, cropwidth::Cint, vbin::Cint, hbin::Cint)::Cuint
end

"""
    SetIsolatedCropModeEx(active, cropheight, cropwidth, vbin, hbin, cropleft, cropbottom)

### Prototype
```c
unsigned int SetIsolatedCropModeEx(int active, int cropheight, int cropwidth, int vbin, int hbin, int cropleft, int cropbottom);
```
"""
function SetIsolatedCropModeEx(active, cropheight, cropwidth, vbin, hbin, cropleft, cropbottom)
    @ccall libandor.SetIsolatedCropModeEx(active::Cint, cropheight::Cint, cropwidth::Cint, vbin::Cint, hbin::Cint, cropleft::Cint, cropbottom::Cint)::Cuint
end

"""
    SetIsolatedCropModeType(type)

### Prototype
```c
unsigned int SetIsolatedCropModeType(int type);
```
"""
function SetIsolatedCropModeType(type)
    @ccall libandor.SetIsolatedCropModeType(type::Cint)::Cuint
end

"""
    SetKineticCycleTime(time)

### Prototype
```c
unsigned int SetKineticCycleTime(float time);
```
"""
function SetKineticCycleTime(time)
    @ccall libandor.SetKineticCycleTime(time::Cfloat)::Cuint
end

"""
    SetMCPGain(gain)

### Prototype
```c
unsigned int SetMCPGain(int gain);
```
"""
function SetMCPGain(gain)
    @ccall libandor.SetMCPGain(gain::Cint)::Cuint
end

"""
    SetMCPGating(gating)

### Prototype
```c
unsigned int SetMCPGating(int gating);
```
"""
function SetMCPGating(gating)
    @ccall libandor.SetMCPGating(gating::Cint)::Cuint
end

"""
    SetMessageWindow(wnd)

### Prototype
```c
unsigned int SetMessageWindow(int wnd);
```
"""
function SetMessageWindow(wnd)
    @ccall libandor.SetMessageWindow(wnd::Cint)::Cuint
end

"""
    SetMetaData(state)

### Prototype
```c
unsigned int SetMetaData(int state);
```
"""
function SetMetaData(state)
    @ccall libandor.SetMetaData(state::Cint)::Cuint
end

"""
    SetMultiTrack(number, height, offset, bottom, gap)

### Prototype
```c
unsigned int SetMultiTrack(int number, int height, int offset, int * bottom, int * gap);
```
"""
function SetMultiTrack(number, height, offset, bottom, gap)
    @ccall libandor.SetMultiTrack(number::Cint, height::Cint, offset::Cint, bottom::Ptr{Cint}, gap::Ptr{Cint})::Cuint
end

"""
    SetMultiTrackHBin(bin)

### Prototype
```c
unsigned int SetMultiTrackHBin(int bin);
```
"""
function SetMultiTrackHBin(bin)
    @ccall libandor.SetMultiTrackHBin(bin::Cint)::Cuint
end

"""
    SetMultiTrackHRange(iStart, iEnd)

### Prototype
```c
unsigned int SetMultiTrackHRange(int iStart, int iEnd);
```
"""
function SetMultiTrackHRange(iStart, iEnd)
    @ccall libandor.SetMultiTrackHRange(iStart::Cint, iEnd::Cint)::Cuint
end

"""
    SetMultiTrackScan(trackHeight, numberTracks, iSIHStart, iSIHEnd, trackHBinning, trackVBinning, trackGap, trackOffset, trackSkip, numberSubFrames)

### Prototype
```c
unsigned int SetMultiTrackScan(int trackHeight, int numberTracks, int iSIHStart, int iSIHEnd, int trackHBinning, int trackVBinning, int trackGap, int trackOffset, int trackSkip, int numberSubFrames);
```
"""
function SetMultiTrackScan(trackHeight, numberTracks, iSIHStart, iSIHEnd, trackHBinning, trackVBinning, trackGap, trackOffset, trackSkip, numberSubFrames)
    @ccall libandor.SetMultiTrackScan(trackHeight::Cint, numberTracks::Cint, iSIHStart::Cint, iSIHEnd::Cint, trackHBinning::Cint, trackVBinning::Cint, trackGap::Cint, trackOffset::Cint, trackSkip::Cint, numberSubFrames::Cint)::Cuint
end

"""
    SetNextAddress(data, lowAdd, highAdd, length, physical)

### Prototype
```c
unsigned int SetNextAddress(at_32 * data, at_32 lowAdd, at_32 highAdd, at_32 length, at_32 physical);
```
"""
function SetNextAddress(data, lowAdd, highAdd, length, physical)
    @ccall libandor.SetNextAddress(data::Ptr{Cint}, lowAdd::Cint, highAdd::Cint, length::Cint, physical::Cint)::Cuint
end

"""
    SetNextAddress16(data, lowAdd, highAdd, length, physical)

### Prototype
```c
unsigned int SetNextAddress16(at_32 * data, at_32 lowAdd, at_32 highAdd, at_32 length, at_32 physical);
```
"""
function SetNextAddress16(data, lowAdd, highAdd, length, physical)
    @ccall libandor.SetNextAddress16(data::Ptr{Cint}, lowAdd::Cint, highAdd::Cint, length::Cint, physical::Cint)::Cuint
end

"""
    SetNumberAccumulations(number)

### Prototype
```c
unsigned int SetNumberAccumulations(int number);
```
"""
function SetNumberAccumulations(number)
    @ccall libandor.SetNumberAccumulations(number::Cint)::Cuint
end

"""
    SetNumberKinetics(number)

### Prototype
```c
unsigned int SetNumberKinetics(int number);
```
"""
function SetNumberKinetics(number)
    @ccall libandor.SetNumberKinetics(number::Cint)::Cuint
end

"""
    SetNumberPrescans(iNumber)

### Prototype
```c
unsigned int SetNumberPrescans(int iNumber);
```
"""
function SetNumberPrescans(iNumber)
    @ccall libandor.SetNumberPrescans(iNumber::Cint)::Cuint
end

"""
    SetOutputAmplifier(typ)

### Prototype
```c
unsigned int SetOutputAmplifier(int typ);
```
"""
function SetOutputAmplifier(typ)
    @ccall libandor.SetOutputAmplifier(typ::Cint)::Cuint
end

"""
    SetOverlapMode(mode)

### Prototype
```c
unsigned int SetOverlapMode(int mode);
```
"""
function SetOverlapMode(mode)
    @ccall libandor.SetOverlapMode(mode::Cint)::Cuint
end

"""
    SetPCIMode(mode, value)

### Prototype
```c
unsigned int SetPCIMode(int mode, int value);
```
"""
function SetPCIMode(mode, value)
    @ccall libandor.SetPCIMode(mode::Cint, value::Cint)::Cuint
end

"""
    SetPhotonCounting(state)

### Prototype
```c
unsigned int SetPhotonCounting(int state);
```
"""
function SetPhotonCounting(state)
    @ccall libandor.SetPhotonCounting(state::Cint)::Cuint
end

"""
    SetPhotonCountingThreshold(min, max)

### Prototype
```c
unsigned int SetPhotonCountingThreshold(at_32 min, at_32 max);
```
"""
function SetPhotonCountingThreshold(min, max)
    @ccall libandor.SetPhotonCountingThreshold(min::Cint, max::Cint)::Cuint
end

"""
    SetPhotonCountingDivisions(noOfDivisions, divisions)

### Prototype
```c
unsigned int SetPhotonCountingDivisions(at_u32 noOfDivisions, at_32 * divisions);
```
"""
function SetPhotonCountingDivisions(noOfDivisions, divisions)
    @ccall libandor.SetPhotonCountingDivisions(noOfDivisions::Cuint, divisions::Ptr{Cint})::Cuint
end

"""
    SetPixelMode(bitdepth, colormode)

### Prototype
```c
unsigned int SetPixelMode(int bitdepth, int colormode);
```
"""
function SetPixelMode(bitdepth, colormode)
    @ccall libandor.SetPixelMode(bitdepth::Cint, colormode::Cint)::Cuint
end

"""
    SetPreAmpGain(index)

### Prototype
```c
unsigned int SetPreAmpGain(int index);
```
"""
function SetPreAmpGain(index)
    @ccall libandor.SetPreAmpGain(index::Cint)::Cuint
end

"""
    SetDualExposureTimes(expTime1, expTime2)

### Prototype
```c
unsigned int SetDualExposureTimes(float expTime1, float expTime2);
```
"""
function SetDualExposureTimes(expTime1, expTime2)
    @ccall libandor.SetDualExposureTimes(expTime1::Cfloat, expTime2::Cfloat)::Cuint
end

"""
    SetDualExposureMode(mode)

### Prototype
```c
unsigned int SetDualExposureMode(int mode);
```
"""
function SetDualExposureMode(mode)
    @ccall libandor.SetDualExposureMode(mode::Cint)::Cuint
end

"""
    SetRandomTracks(numTracks, areas)

### Prototype
```c
unsigned int SetRandomTracks(int numTracks, int * areas);
```
"""
function SetRandomTracks(numTracks, areas)
    @ccall libandor.SetRandomTracks(numTracks::Cint, areas::Ptr{Cint})::Cuint
end

"""
    SetReadMode(mode)

### Prototype
```c
unsigned int SetReadMode(int mode);
```
"""
function SetReadMode(mode)
    @ccall libandor.SetReadMode(mode::Cint)::Cuint
end

"""
    SetReadoutRegisterPacking(mode)

### Prototype
```c
unsigned int SetReadoutRegisterPacking(unsigned int mode);
```
"""
function SetReadoutRegisterPacking(mode)
    @ccall libandor.SetReadoutRegisterPacking(mode::Cuint)::Cuint
end

"""
    SetRegisterDump(mode)

### Prototype
```c
unsigned int SetRegisterDump(int mode);
```
"""
function SetRegisterDump(mode)
    @ccall libandor.SetRegisterDump(mode::Cint)::Cuint
end

"""
    SetRingExposureTimes(numTimes, times)

### Prototype
```c
unsigned int SetRingExposureTimes(int numTimes, float * times);
```
"""
function SetRingExposureTimes(numTimes, times)
    @ccall libandor.SetRingExposureTimes(numTimes::Cint, times::Ptr{Cfloat})::Cuint
end

"""
    SetShutter(typ, mode, closingtime, openingtime)

### Prototype
```c
unsigned int SetShutter(int typ, int mode, int closingtime, int openingtime);
```
"""
function SetShutter(typ, mode, closingtime, openingtime)
    @ccall libandor.SetShutter(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint)::Cuint
end

"""
    SetShutterEx(typ, mode, closingtime, openingtime, extmode)

### Prototype
```c
unsigned int SetShutterEx(int typ, int mode, int closingtime, int openingtime, int extmode);
```
"""
function SetShutterEx(typ, mode, closingtime, openingtime, extmode)
    @ccall libandor.SetShutterEx(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint, extmode::Cint)::Cuint
end

"""
    SetShutters(typ, mode, closingtime, openingtime, exttype, extmode, dummy1, dummy2)

### Prototype
```c
unsigned int SetShutters(int typ, int mode, int closingtime, int openingtime, int exttype, int extmode, int dummy1, int dummy2);
```
"""
function SetShutters(typ, mode, closingtime, openingtime, exttype, extmode, dummy1, dummy2)
    @ccall libandor.SetShutters(typ::Cint, mode::Cint, closingtime::Cint, openingtime::Cint, exttype::Cint, extmode::Cint, dummy1::Cint, dummy2::Cint)::Cuint
end

"""
    SetSifComment(comment)

### Prototype
```c
unsigned int SetSifComment(char * comment);
```
"""
function SetSifComment(comment)
    @ccall libandor.SetSifComment(comment::Cstring)::Cuint
end

"""
    SetSingleTrack(centre, height)

### Prototype
```c
unsigned int SetSingleTrack(int centre, int height);
```
"""
function SetSingleTrack(centre, height)
    @ccall libandor.SetSingleTrack(centre::Cint, height::Cint)::Cuint
end

"""
    SetSingleTrackHBin(bin)

### Prototype
```c
unsigned int SetSingleTrackHBin(int bin);
```
"""
function SetSingleTrackHBin(bin)
    @ccall libandor.SetSingleTrackHBin(bin::Cint)::Cuint
end

"""
    SetSpool(active, method, path, framebuffersize)

### Prototype
```c
unsigned int SetSpool(int active, int method, char * path, int framebuffersize);
```
"""
function SetSpool(active, method, path, framebuffersize)
    @ccall libandor.SetSpool(active::Cint, method::Cint, path::Cstring, framebuffersize::Cint)::Cuint
end

"""
    SetSpoolThreadCount(count)

### Prototype
```c
unsigned int SetSpoolThreadCount(int count);
```
"""
function SetSpoolThreadCount(count)
    @ccall libandor.SetSpoolThreadCount(count::Cint)::Cuint
end

"""
    SetStorageMode(mode)

### Prototype
```c
unsigned int SetStorageMode(at_32 mode);
```
"""
function SetStorageMode(mode)
    @ccall libandor.SetStorageMode(mode::Cint)::Cuint
end

"""
    SetTemperature(temperature)

### Prototype
```c
unsigned int SetTemperature(int temperature);
```
"""
function SetTemperature(temperature)
    @ccall libandor.SetTemperature(temperature::Cint)::Cuint
end

"""
    SetTriggerMode(mode)

### Prototype
```c
unsigned int SetTriggerMode(int mode);
```
"""
function SetTriggerMode(mode)
    @ccall libandor.SetTriggerMode(mode::Cint)::Cuint
end

"""
    SetTriggerInvert(mode)

### Prototype
```c
unsigned int SetTriggerInvert(int mode);
```
"""
function SetTriggerInvert(mode)
    @ccall libandor.SetTriggerInvert(mode::Cint)::Cuint
end

"""
    GetTriggerLevelRange(minimum, maximum)

### Prototype
```c
unsigned int GetTriggerLevelRange(float * minimum, float * maximum);
```
"""
function GetTriggerLevelRange(minimum, maximum)
    @ccall libandor.GetTriggerLevelRange(minimum::Ptr{Cfloat}, maximum::Ptr{Cfloat})::Cuint
end

"""
    SetTriggerLevel(f_level)

### Prototype
```c
unsigned int SetTriggerLevel(float f_level);
```
"""
function SetTriggerLevel(f_level)
    @ccall libandor.SetTriggerLevel(f_level::Cfloat)::Cuint
end

"""
    SetIODirection(index, iDirection)

### Prototype
```c
unsigned int SetIODirection(int index, int iDirection);
```
"""
function SetIODirection(index, iDirection)
    @ccall libandor.SetIODirection(index::Cint, iDirection::Cint)::Cuint
end

"""
    SetIOLevel(index, iLevel)

### Prototype
```c
unsigned int SetIOLevel(int index, int iLevel);
```
"""
function SetIOLevel(index, iLevel)
    @ccall libandor.SetIOLevel(index::Cint, iLevel::Cint)::Cuint
end

"""
    SetUSGenomics(width, height)

### Prototype
```c
unsigned int SetUSGenomics(at_32 width, at_32 height);
```
"""
function SetUSGenomics(width, height)
    @ccall libandor.SetUSGenomics(width::Cint, height::Cint)::Cuint
end

"""
    SetVerticalRowBuffer(rows)

### Prototype
```c
unsigned int SetVerticalRowBuffer(int rows);
```
"""
function SetVerticalRowBuffer(rows)
    @ccall libandor.SetVerticalRowBuffer(rows::Cint)::Cuint
end

"""
    SetVerticalSpeed(index)

### Prototype
```c
unsigned int SetVerticalSpeed(int index);
```
"""
function SetVerticalSpeed(index)
    @ccall libandor.SetVerticalSpeed(index::Cint)::Cuint
end

"""
    SetVirtualChip(state)

### Prototype
```c
unsigned int SetVirtualChip(int state);
```
"""
function SetVirtualChip(state)
    @ccall libandor.SetVirtualChip(state::Cint)::Cuint
end

"""
    SetVSAmplitude(index)

### Prototype
```c
unsigned int SetVSAmplitude(int index);
```
"""
function SetVSAmplitude(index)
    @ccall libandor.SetVSAmplitude(index::Cint)::Cuint
end

"""
    SetVSSpeed(index)

### Prototype
```c
unsigned int SetVSSpeed(int index);
```
"""
function SetVSSpeed(index)
    @ccall libandor.SetVSSpeed(index::Cint)::Cuint
end

# no prototype is found for this function at atmcdLXd.h:501:14, please use with caution
"""
    ShutDown()

### Prototype
```c
unsigned int ShutDown();
```
"""
function ShutDown()
    @ccall libandor.ShutDown()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:502:14, please use with caution
"""
    StartAcquisition()

### Prototype
```c
unsigned int StartAcquisition();
```
"""
function StartAcquisition()
    @ccall libandor.StartAcquisition()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:503:14, please use with caution
"""
    UnMapPhysicalAddress()

### Prototype
```c
unsigned int UnMapPhysicalAddress();
```
"""
function UnMapPhysicalAddress()
    @ccall libandor.UnMapPhysicalAddress()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:504:14, please use with caution
"""
    UpdateDDGTimings()

### Prototype
```c
unsigned int UpdateDDGTimings();
```
"""
function UpdateDDGTimings()
    @ccall libandor.UpdateDDGTimings()::Cuint
end

# no prototype is found for this function at atmcdLXd.h:505:14, please use with caution
"""
    WaitForAcquisition()

### Prototype
```c
unsigned int WaitForAcquisition();
```
"""
function WaitForAcquisition()
    @ccall libandor.WaitForAcquisition()::Cuint
end

"""
    WaitForAcquisitionByHandle(cameraHandle)

### Prototype
```c
unsigned int WaitForAcquisitionByHandle(at_32 cameraHandle);
```
"""
function WaitForAcquisitionByHandle(cameraHandle)
    @ccall libandor.WaitForAcquisitionByHandle(cameraHandle::Cint)::Cuint
end

"""
    WaitForAcquisitionByHandleTimeOut(cameraHandle, iTimeOutMs)

### Prototype
```c
unsigned int WaitForAcquisitionByHandleTimeOut(long cameraHandle, int iTimeOutMs);
```
"""
function WaitForAcquisitionByHandleTimeOut(cameraHandle, iTimeOutMs)
    @ccall libandor.WaitForAcquisitionByHandleTimeOut(cameraHandle::Clong, iTimeOutMs::Cint)::Cuint
end

"""
    WaitForAcquisitionTimeOut(iTimeOutMs)

### Prototype
```c
unsigned int WaitForAcquisitionTimeOut(int iTimeOutMs);
```
"""
function WaitForAcquisitionTimeOut(iTimeOutMs)
    @ccall libandor.WaitForAcquisitionTimeOut(iTimeOutMs::Cint)::Cuint
end

"""
    WhiteBalance(wRed, wGreen, wBlue, fRelR, fRelB, info)

### Prototype
```c
unsigned int WhiteBalance(unsigned short * wRed, unsigned short * wGreen, unsigned short * wBlue, float * fRelR, float * fRelB, WhiteBalanceInfo * info);
```
"""
function WhiteBalance(wRed, wGreen, wBlue, fRelR, fRelB, info)
    @ccall libandor.WhiteBalance(wRed::Ptr{Cushort}, wGreen::Ptr{Cushort}, wBlue::Ptr{Cushort}, fRelR::Ptr{Cfloat}, fRelB::Ptr{Cfloat}, info::Ptr{WhiteBalanceInfo})::Cuint
end

"""
    OA_Initialize(pcFilename, uiFileNameLen)

### Prototype
```c
unsigned int OA_Initialize(const char * const pcFilename, unsigned int uiFileNameLen);
```
"""
function OA_Initialize(pcFilename, uiFileNameLen)
    @ccall libandor.OA_Initialize(pcFilename::Cstring, uiFileNameLen::Cuint)::Cuint
end

"""
    OA_IsPreSetModeAvailable(pcModeName)

### Prototype
```c
unsigned int OA_IsPreSetModeAvailable(const char * const pcModeName);
```
"""
function OA_IsPreSetModeAvailable(pcModeName)
    @ccall libandor.OA_IsPreSetModeAvailable(pcModeName::Cstring)::Cuint
end

"""
    OA_EnableMode(pcModeName)

### Prototype
```c
unsigned int OA_EnableMode(const char * const pcModeName);
```
"""
function OA_EnableMode(pcModeName)
    @ccall libandor.OA_EnableMode(pcModeName::Cstring)::Cuint
end

"""
    OA_GetModeAcqParams(pcModeName, pcListOfParams)

### Prototype
```c
unsigned int OA_GetModeAcqParams(const char * const pcModeName, char * const pcListOfParams);
```
"""
function OA_GetModeAcqParams(pcModeName, pcListOfParams)
    @ccall libandor.OA_GetModeAcqParams(pcModeName::Cstring, pcListOfParams::Cstring)::Cuint
end

"""
    OA_GetUserModeNames(pcListOfModes)

### Prototype
```c
unsigned int OA_GetUserModeNames(char * pcListOfModes);
```
"""
function OA_GetUserModeNames(pcListOfModes)
    @ccall libandor.OA_GetUserModeNames(pcListOfModes::Cstring)::Cuint
end

"""
    OA_GetPreSetModeNames(pcListOfModes)

### Prototype
```c
unsigned int OA_GetPreSetModeNames(char * pcListOfModes);
```
"""
function OA_GetPreSetModeNames(pcListOfModes)
    @ccall libandor.OA_GetPreSetModeNames(pcListOfModes::Cstring)::Cuint
end

"""
    OA_GetNumberOfUserModes(puiNumberOfModes)

### Prototype
```c
unsigned int OA_GetNumberOfUserModes(unsigned int * const puiNumberOfModes);
```
"""
function OA_GetNumberOfUserModes(puiNumberOfModes)
    @ccall libandor.OA_GetNumberOfUserModes(puiNumberOfModes::Ptr{Cuint})::Cuint
end

"""
    OA_GetNumberOfPreSetModes(puiNumberOfModes)

### Prototype
```c
unsigned int OA_GetNumberOfPreSetModes(unsigned int * const puiNumberOfModes);
```
"""
function OA_GetNumberOfPreSetModes(puiNumberOfModes)
    @ccall libandor.OA_GetNumberOfPreSetModes(puiNumberOfModes::Ptr{Cuint})::Cuint
end

"""
    OA_GetNumberOfAcqParams(pcModeName, puiNumberOfParams)

### Prototype
```c
unsigned int OA_GetNumberOfAcqParams(const char * const pcModeName, unsigned int * const puiNumberOfParams);
```
"""
function OA_GetNumberOfAcqParams(pcModeName, puiNumberOfParams)
    @ccall libandor.OA_GetNumberOfAcqParams(pcModeName::Cstring, puiNumberOfParams::Ptr{Cuint})::Cuint
end

"""
    OA_AddMode(pcModeName, uiModeNameLen, pcModeDescription, uiModeDescriptionLen)

### Prototype
```c
unsigned int OA_AddMode(char * pcModeName, unsigned int uiModeNameLen, char * pcModeDescription, unsigned int uiModeDescriptionLen);
```
"""
function OA_AddMode(pcModeName, uiModeNameLen, pcModeDescription, uiModeDescriptionLen)
    @ccall libandor.OA_AddMode(pcModeName::Cstring, uiModeNameLen::Cuint, pcModeDescription::Cstring, uiModeDescriptionLen::Cuint)::Cuint
end

"""
    OA_WriteToFile(pcFileName, uiFileNameLen)

### Prototype
```c
unsigned int OA_WriteToFile(const char * const pcFileName, unsigned int uiFileNameLen);
```
"""
function OA_WriteToFile(pcFileName, uiFileNameLen)
    @ccall libandor.OA_WriteToFile(pcFileName::Cstring, uiFileNameLen::Cuint)::Cuint
end

"""
    OA_DeleteMode(pcModeName, uiModeNameLen)

### Prototype
```c
unsigned int OA_DeleteMode(const char * const pcModeName, unsigned int uiModeNameLen);
```
"""
function OA_DeleteMode(pcModeName, uiModeNameLen)
    @ccall libandor.OA_DeleteMode(pcModeName::Cstring, uiModeNameLen::Cuint)::Cuint
end

"""
    OA_SetInt(pcModeName, pcModeParam, iIntValue)

### Prototype
```c
unsigned int OA_SetInt(const char * const pcModeName, const char * pcModeParam, const int iIntValue);
```
"""
function OA_SetInt(pcModeName, pcModeParam, iIntValue)
    @ccall libandor.OA_SetInt(pcModeName::Cstring, pcModeParam::Cstring, iIntValue::Cint)::Cuint
end

"""
    OA_SetFloat(pcModeName, pcModeParam, fFloatValue)

### Prototype
```c
unsigned int OA_SetFloat(const char * const pcModeName, const char * pcModeParam, const float fFloatValue);
```
"""
function OA_SetFloat(pcModeName, pcModeParam, fFloatValue)
    @ccall libandor.OA_SetFloat(pcModeName::Cstring, pcModeParam::Cstring, fFloatValue::Cfloat)::Cuint
end

"""
    OA_SetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)

### Prototype
```c
unsigned int OA_SetString(const char * const pcModeName, const char * pcModeParam, char * pcStringValue, const unsigned int uiStringLen);
```
"""
function OA_SetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)
    @ccall libandor.OA_SetString(pcModeName::Cstring, pcModeParam::Cstring, pcStringValue::Cstring, uiStringLen::Cuint)::Cuint
end

"""
    OA_GetInt(pcModeName, pcModeParam, iIntValue)

### Prototype
```c
unsigned int OA_GetInt(const char * const pcModeName, const char * const pcModeParam, int * iIntValue);
```
"""
function OA_GetInt(pcModeName, pcModeParam, iIntValue)
    @ccall libandor.OA_GetInt(pcModeName::Cstring, pcModeParam::Cstring, iIntValue::Ptr{Cint})::Cuint
end

"""
    OA_GetFloat(pcModeName, pcModeParam, fFloatValue)

### Prototype
```c
unsigned int OA_GetFloat(const char * const pcModeName, const char * const pcModeParam, float * fFloatValue);
```
"""
function OA_GetFloat(pcModeName, pcModeParam, fFloatValue)
    @ccall libandor.OA_GetFloat(pcModeName::Cstring, pcModeParam::Cstring, fFloatValue::Ptr{Cfloat})::Cuint
end

"""
    OA_GetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)

### Prototype
```c
unsigned int OA_GetString(const char * const pcModeName, const char * const pcModeParam, char * pcStringValue, const unsigned int uiStringLen);
```
"""
function OA_GetString(pcModeName, pcModeParam, pcStringValue, uiStringLen)
    @ccall libandor.OA_GetString(pcModeName::Cstring, pcModeParam::Cstring, pcStringValue::Cstring, uiStringLen::Cuint)::Cuint
end

"""
    Filter_SetMode(mode)

### Prototype
```c
unsigned int Filter_SetMode(unsigned int mode);
```
"""
function Filter_SetMode(mode)
    @ccall libandor.Filter_SetMode(mode::Cuint)::Cuint
end

"""
    Filter_GetMode(mode)

### Prototype
```c
unsigned int Filter_GetMode(unsigned int * mode);
```
"""
function Filter_GetMode(mode)
    @ccall libandor.Filter_GetMode(mode::Ptr{Cuint})::Cuint
end

"""
    Filter_SetThreshold(threshold)

### Prototype
```c
unsigned int Filter_SetThreshold(float threshold);
```
"""
function Filter_SetThreshold(threshold)
    @ccall libandor.Filter_SetThreshold(threshold::Cfloat)::Cuint
end

"""
    Filter_GetThreshold(threshold)

### Prototype
```c
unsigned int Filter_GetThreshold(float * threshold);
```
"""
function Filter_GetThreshold(threshold)
    @ccall libandor.Filter_GetThreshold(threshold::Ptr{Cfloat})::Cuint
end

"""
    Filter_SetDataAveragingMode(mode)

### Prototype
```c
unsigned int Filter_SetDataAveragingMode(int mode);
```
"""
function Filter_SetDataAveragingMode(mode)
    @ccall libandor.Filter_SetDataAveragingMode(mode::Cint)::Cuint
end

"""
    Filter_GetDataAveragingMode(mode)

### Prototype
```c
unsigned int Filter_GetDataAveragingMode(int * mode);
```
"""
function Filter_GetDataAveragingMode(mode)
    @ccall libandor.Filter_GetDataAveragingMode(mode::Ptr{Cint})::Cuint
end

"""
    Filter_SetAveragingFrameCount(frames)

### Prototype
```c
unsigned int Filter_SetAveragingFrameCount(int frames);
```
"""
function Filter_SetAveragingFrameCount(frames)
    @ccall libandor.Filter_SetAveragingFrameCount(frames::Cint)::Cuint
end

"""
    Filter_GetAveragingFrameCount(frames)

### Prototype
```c
unsigned int Filter_GetAveragingFrameCount(int * frames);
```
"""
function Filter_GetAveragingFrameCount(frames)
    @ccall libandor.Filter_GetAveragingFrameCount(frames::Ptr{Cint})::Cuint
end

"""
    Filter_SetAveragingFactor(averagingFactor)

### Prototype
```c
unsigned int Filter_SetAveragingFactor(int averagingFactor);
```
"""
function Filter_SetAveragingFactor(averagingFactor)
    @ccall libandor.Filter_SetAveragingFactor(averagingFactor::Cint)::Cuint
end

"""
    Filter_GetAveragingFactor(averagingFactor)

### Prototype
```c
unsigned int Filter_GetAveragingFactor(int * averagingFactor);
```
"""
function Filter_GetAveragingFactor(averagingFactor)
    @ccall libandor.Filter_GetAveragingFactor(averagingFactor::Ptr{Cint})::Cuint
end

"""
    PostProcessNoiseFilter(pInputImage, pOutputImage, iOutputBufferSize, iBaseline, iMode, fThreshold, iHeight, iWidth)

### Prototype
```c
unsigned int PostProcessNoiseFilter(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iBaseline, int iMode, float fThreshold, int iHeight, int iWidth);
```
"""
function PostProcessNoiseFilter(pInputImage, pOutputImage, iOutputBufferSize, iBaseline, iMode, fThreshold, iHeight, iWidth)
    @ccall libandor.PostProcessNoiseFilter(pInputImage::Ptr{Cint}, pOutputImage::Ptr{Cint}, iOutputBufferSize::Cint, iBaseline::Cint, iMode::Cint, fThreshold::Cfloat, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessCountConvert(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iBaseline, iMode, iEmGain, fQE, fSensitivity, iHeight, iWidth)

### Prototype
```c
unsigned int PostProcessCountConvert(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iBaseline, int iMode, int iEmGain, float fQE, float fSensitivity, int iHeight, int iWidth);
```
"""
function PostProcessCountConvert(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iBaseline, iMode, iEmGain, fQE, fSensitivity, iHeight, iWidth)
    @ccall libandor.PostProcessCountConvert(pInputImage::Ptr{Cint}, pOutputImage::Ptr{Cint}, iOutputBufferSize::Cint, iNumImages::Cint, iBaseline::Cint, iMode::Cint, iEmGain::Cint, fQE::Cfloat, fSensitivity::Cfloat, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessPhotonCounting(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iNumframes, iNumberOfThresholds, pfThreshold, iHeight, iWidth)

### Prototype
```c
unsigned int PostProcessPhotonCounting(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iNumframes, int iNumberOfThresholds, float * pfThreshold, int iHeight, int iWidth);
```
"""
function PostProcessPhotonCounting(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iNumframes, iNumberOfThresholds, pfThreshold, iHeight, iWidth)
    @ccall libandor.PostProcessPhotonCounting(pInputImage::Ptr{Cint}, pOutputImage::Ptr{Cint}, iOutputBufferSize::Cint, iNumImages::Cint, iNumframes::Cint, iNumberOfThresholds::Cint, pfThreshold::Ptr{Cfloat}, iHeight::Cint, iWidth::Cint)::Cuint
end

"""
    PostProcessDataAveraging(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor)

### Prototype
```c
unsigned int PostProcessDataAveraging(at_32 * pInputImage, at_32 * pOutputImage, int iOutputBufferSize, int iNumImages, int iAveragingFilterMode, int iHeight, int iWidth, int iFrameCount, int iAveragingFactor);
```
"""
function PostProcessDataAveraging(pInputImage, pOutputImage, iOutputBufferSize, iNumImages, iAveragingFilterMode, iHeight, iWidth, iFrameCount, iAveragingFactor)
    @ccall libandor.PostProcessDataAveraging(pInputImage::Ptr{Cint}, pOutputImage::Ptr{Cint}, iOutputBufferSize::Cint, iNumImages::Cint, iAveragingFilterMode::Cint, iHeight::Cint, iWidth::Cint, iFrameCount::Cint, iAveragingFactor::Cint)::Cuint
end

const at_u16 = Cushort

const at_32 = Cint

const at_u32 = Cuint

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

const KERN_MEM_ERROR = 20025

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

const DRV_USB_INTERRUPT_ENDPOINT_TIMEOUT = 20102

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

const DRV_OA_CAMERA_NOT_AVAILABLE = 20196

const DRV_PROCESSING_FAILED = 20211

const AC_ACQMODE_SINGLE = 1

const AC_ACQMODE_VIDEO = 2

const AC_ACQMODE_ACCUMULATE = 4

const AC_ACQMODE_KINETIC = 8

const AC_ACQMODE_FRAMETRANSFER = 16

const AC_ACQMODE_FASTKINETICS = 32

const AC_ACQMODE_OVERLAP = 64

const AC_ACQMODE_TDI = 0x80

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

const AC_TRIGGERMODE_EXTERNAL_RISING = 0x0100

const AC_TRIGGERMODE_EXTERNAL_PURGE = 0x0200

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

const AC_CAMERATYPE_CMOS_GEN2 = 29

const AC_CAMERATYPE_ISTAR_SCMOS = 30

const AC_CAMERATYPE_IKONLR = 31

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

const AC_SETFUNCTION_SUPERKINETICS = 0x20000000

const AC_SETFUNCTION_TIMESCAN = 0x40000000

const AC_SETFUNCTION_CROPMODETYPE = 0x80000000

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

const AC_FEATURES2_ESD_EVENTS = 1

const AC_FEATURES2_DUAL_PORT_CONFIGURATION = 2

const AC_FEATURES2_OVERTEMP_EVENTS = 4

end # module
