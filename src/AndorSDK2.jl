module AndorSDK2

using EnumX

include("LibAndorSDK2.jl")
using .LibAndorSDK2

include("exceptions.jl")

function initialize(dir::AbstractString)
    retval = LibAndorSDK2.Initialize(dir)
    check_error(retval)
end

initialize() = initialize(joinpath(AndorSDK2_jll.artifact_dir, "share", "AndorSDK2"))

function abort_acquisition()
    retval = LibAndorSDK2.AbortAcquisition()
    check_error(retval)
end

function start_acquisition()
    retval = LibAndorSDK2.StartAcquisition()
    check_error(retval)
end

function cancel_wait()
    retval = LibAndorSDK2.CancelWait()
    check_error(retval)
end

function wait_for_acquisition()
    retval = LibAndorSDK2.WaitForAcquisition()
    check_error(retval)
end

function wait_for_acquisition_time_out(timeout)
    retval = LibAndorSDK2.WaitForAcquisitionTimeOut(timeout)
    check_error(retval)
end

function wait_for_acquisition_by_handle(handle)
    retval = LibAndorSDK2.WaitForAcquisitionByHandle(handle)
    check_error(retval)
end

function wait_for_acquisition_by_handle_time_out(handle, timeout)
    retval = LibAndorSDK2.WaitForAcquisitionByHandleTimeOut(handle, timeout)
    check_error(retval)
end

function cooler_off()
    retval = LibAndorSDK2.CoolerOFF()
    check_error(retval)
end

function cooler_on()
    retval = LibAndorSDK2.CoolerON()
    check_error(retval)
end

function keep_cleans!(state::Bool)
    retval = LibAndorSDK2.EnableKeepCleans(state)
    check_error(retval)
end

function sensor_compensation!(state::Bool)
    retval = LibAndorSDK2.EnableSensorCompensation(state)
    check_error(retval)
end

function free_internal_memory()
    retval = LibAndorSDK2.FreeInternalMemory()
    check_error(retval)
end

function acquired_data(buf::AbstractVector{T}) where {T<:Union{Int32,UInt16,Float32}}
    GC.@preserve buf begin
        retval = LibAndorSDK2.DRV_SUCCESS
        if T == Int32
            retval = LibAndorSDK2.GetAcquiredData(buf, length(buf))
        elseif T == UInt16
            retval = LibAndorSDK2.GetAcquiredData16(buf, length(buf))
        elseif T == Float32
            retval = LibAndorSDK2.GetAcquiredFloatData(buf, length(buf))
        else
            throw(ArgumentError("Unsupported buffer type"))
        end
        check_error(retval)
        return retval == LibAndorSDK2.DRV_SUCCESS
    end
end

function acquired_data(::Type{T}, size) where {T<:Union{Int32,UInt16,Float32}}
    buf = Vector{T}(undef, size)
    acquired_data(buf)
    return buf
end

function acquired_data(::Type{T}) where {T}
    x, y = detector()
    acquired_data(T, x * y)
end

acquired_data() = acquired_data(Int32)

function most_recent_image(buf::AbstractVector{T}) where {T<:Union{Int32,UInt16}}
    GC.@preserve buf begin
        retval = LibAndorSDK2.DRV_SUCCESS
        if T == Int32
            retval = LibAndorSDK2.GetMostRecentImage(buf, length(buf))
        elseif T == UInt16
            retval = LibAndorSDK2.GetMostRecentImage16(buf, length(buf))
        else
            throw(ArgumentError("Unsupported buffer type"))
        end
        check_error(retval)
        return retval == LibAndorSDK2.DRV_SUCCESS
    end
end

function most_recent_image(::Type{T}, size) where {T<:Union{Int32,UInt16,Float32}}
    buf = Vector{T}(undef, size)
    most_recent_image(buf)
    return buf
end

function most_recent_image(::Type{T}) where {T}
    x, y = detector()
    most_recent_image(T, x * y)
end

most_recent_image() = most_recent_image(Int32)

function acquisition_progress()
    acc = Ref{Clong}()
    series = Ref{Clong}()
    retval = LibAndorSDK2.GetAcquisitionProgress(acc, series)
    check_error(retval)
    (acc[], series[])
end

function acquisition_timings()
    exposure = Ref{Cfloat}()
    accumulate = Ref{Cfloat}()
    kinetic = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAcquisitionTimings(exposure, accumulate, kinetic)
    check_error(retval)
    (exposure[], accumulate[], kinetic[])
end

function adjusted_ring_exposure_times(inumTimes)
    fptimes = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAdjustedRingExposureTimes(inumTimes, fptimes)
    check_error(retval)
    fptimes[]
end

function amp_description(index)
    name = zeros(UInt8, 65)
    retval = LibAndorSDK2.GetAmpDesc(index, pointer(name), length(name))
    check_error(retval)
    name
end

function amp_max_speed(index)
    speed = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAmpMaxSpeed(index, speed)
    check_error(retval)
    speed[]
end

function available_cameras()
    num_cameras = Ref{Clong}()
    retval = LibAndorSDK2.GetAvailableCameras(num_cameras)
    check_error(retval)
    num_cameras[]
end

function baseline_clamp()
    state = Ref{Cint}()
    retval = LibAndorSDK2.GetBaselineClamp(state)
    check_error(retval)
    state[]
end

function bit_depth(channel)
    depth = Ref{Cint}()
    retval = LibAndorSDK2.GetBitDepth(channel, depth)
    check_error(retval)
    depth[]
end

function camera_handle(index)
    handle = Ref{Clong}()
    retval = LibAndorSDK2.GetCameraHandle(index, handle)
    check_error(retval)
    handle[]
end

function camera_serial_number()
    serial_number = Ref{Cint}()
    retval = LibAndorSDK2.GetCameraSerialNumber(serial_number)
    check_error(retval)
    serial_number[]
end

function current_camera()
    handle = Ref{Clong}()
    retval = LibAndorSDK2.GetCurrentCamera(handle)
    check_error(retval)
    handle[]
end

function detector()
    width = Ref{Cint}()
    height = Ref{Cint}()
    retval = LibAndorSDK2.GetDetector(width, height)
    check_error(retval)
    (Int64(width[]), Int64(height[]))
end

function em_advanced()
    state = Ref{Cint}()
    retval = LibAndorSDK2.GetEMAdvanced(state)
    check_error(retval)
    state[]
end

function emccd_gain()
    gain = Ref{Cint}()
    retval = LibAndorSDK2.GetEMCCDGain(gain)
    check_error(retval)
    gain[]
end

function emccd_gain_range()
    low = Ref{Cint}()
    high = Ref{Cint}()
    retval = LibAndorSDK2.GetEMGainRange(low, high)
    check_error(retval)
    (low[], high[])
end

function fastest_recommended_vss_speed()
    index = Ref{Cint}()
    speed = Ref{Cfloat}()
    retval = LibAndorSDK2.GetFastestRecommendedVSSpeed(index, speed)
    check_error(retval)
    (index[], speed[])
end

function number_adc_channels()
    num_channels = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberADChannels(num_channels)
    check_error(retval)
    num_channels[]
end

function number_amp()
    num_amps = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberAmp(num_amps)
    check_error(retval)
    num_amps[]
end

function number_new_images()
    first = Ref{Cint}()
    last = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberNewImages(first, last)
    check_error(retval)
    (first[], last[])
end

function keep_clean_time()
    KeepCleanTime = Ref{Cfloat}()
    retval = LibAndorSDK2.GetKeepCleanTime(KeepCleanTime)
    check_error(retval)
    KeepCleanTime[]
end

function maximum_binning(ReadMode, HorzVert)
    MaxBinning = Ref{Cint}()
    retval = LibAndorSDK2.GetMaximumBinning(ReadMode, HorzVert, MaxBinning)
    check_error(retval)
    MaxBinning[]
end

function maximum_exposure()
    MaxExp = Ref{Cfloat}()
    retval = LibAndorSDK2.GetMaximumExposure(MaxExp)
    check_error(retval)
end

function shutdown()
    retval = LibAndorSDK2.ShutDown()
    check_error(retval)
end

function accumulation_cycle_time!(time::Float32)
    retval = LibAndorSDK2.SetAccumulationCycleTime(time)
    check_error(retval)
end

@enumx AcquisitionMode::Cint begin
    SINGLE_SCAN = 1
    ACCUMULATE = 2
    KINETICS = 3
    FAST_KINETICS = 4
    RUN_TILL_ABORT = 5
end

function acquisition_mode!(mode::AcquisitionMode.T)
    retval = LibAndorSDK2.SetAcquisitionMode(Integer(mode))
    check_error(retval)
end

function adc_channel!(channel)
    retval = LibAndorSDK2.SetADChannel(channel)
    check_error(retval)
end

function baseline_clamp!(state)
    retval = LibAndorSDK2.SetBaselineClamp(state)
    check_error(retval)
end

function baseline_offset!(offset)
    retval = LibAndorSDK2.SetBaselineOffset(offset)
    check_error(retval)
end

function charge_shifting!(num_rows, num_repeats)
    retval = LibAndorSDK2.SetChargeShifting(num_rows, num_repeats)
    check_error(retval)
end

@enumx CoolerMode::Cint begin
    MAINTAIN = 0
    RETURN_TO_AMBIENT = 1
end

function cooler_mode!(mode::CoolerMode.T)
    retval = LibAndorSDK2.SetCoolerMode(Integer(mode))
    check_error(retval)
end

@enumx CountConvertMode::Cint begin
    DATA_IN_COUNTS = 0
    DATA_IN_ELECTRONS = 1
    DATA_IN_PHOTONS = 2
end

function count_convert_mode!(mode::CountConvertMode.T)
    retval = LibAndorSDK2.SetCountConvertMode(Integer(mode))
    check_error(retval)
end

function count_convert_wavelength!(wavelength)
    retval = LibAndorSDK2.SetCountConvertWavelength(wavelength)
    check_error(retval)
end

function crop_mode!(active::Bool, height)
    (_, detector_height) = detector()

    if height > detector_height
        throw(ArgumentError("Crop height exceeds detector height"))
    end

    retval = LibAndorSDK2.SetCropMode(Integer(active), height, 0)
    check_error(retval)
end

function custom_track_hbin!(binning)
    retval = LibAndorSDK2.SetCustomTrackHBin(binning)
    check_error(retval)
end

function em_advanced!(enable::Bool)
    retval = LibAndorSDK2.SetEMAdvanced(enable)
    check_error(retval)
end

function emccd_gain!(gain)
    retval = LibAndorSDK2.SetEMCCDGain(gain)
    check_error(retval)
end

@enumx EMGainMode::Cint begin
    DAC = 1
    LINEAR = 2
    REAL = 3
end

function em_gain_mode!(mode::EMGainMode.T)
    retval = LibAndorSDK2.SetEMGainMode(Integer(mode))
    check_error(retval)
end

function exposure_time!(time)
    retval = LibAndorSDK2.SetExposureTime(time)
    check_error(retval)
end

@enumx TriggerTermination::Cint begin
    FIFTY_OHM = 0
    HIGH_Z = 1
end

function external_trigger_termination!(mode::TriggerTermination.T)
    retval = LibAndorSDK2.SetExternalTriggerTermination(Integer(mode))
    check_error(retval)
end

@enumx FanMode::Cint begin
    ON_FULL = 0
    ON_LOW = 1
    OFF = 2
end

function fan_mode!(mode::FanMode.T)
    retval = LibAndorSDK2.SetFanMode(Integer(mode))
    check_error(retval)
end

function fast_ext_trigger!(enable::Bool)
    retval = LibAndorSDK2.SetFastExtTrigger(enable)
    check_error(retval)
end

function fast_kinetics!(exposed_rows, series_length, time, mode, hbin=1, vbin=1, offset=0)
    retval = LibAndorSDK2.SetFastKineticsEx(exposed_rows, series_length, time, mode, hbin, vbin, offset)
    check_error(retval)
end

function frame_transfer_mode!(mode::Bool)
    retval = LibAndorSDK2.SetFrameTransferMode(Integer(mode))
    check_error(retval)
end

function num_hss_speeds(channel, type)
    num_speeds = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberHSSpeeds(channel, type, num_speeds)
    check_error(retval)
    num_speeds[]
end

function hss_speed(channel, type, index)
    speed = Ref{Cfloat}()
    retval = LibAndorSDK2.GetHSSpeed(channel, type, index, speed)
    check_error(retval)
    speed[]
end

function hss_speed!(type, index)
    retval = LibAndorSDK2.SetHSSpeed(type, index)
    check_error(retval)
end

function number_pre_amp_gains()
    num_gains = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberPreAmpGains(num_gains)
    check_error(retval)
    num_gains[]
end

function number_ring_exposure_times()
    num_times = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberRingExposureTimes(num_times)
    check_error(retval)
    num_times[]
end

function number_vertical_speeds()
    num_speeds = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberVerticalSpeeds(num_speeds)
    check_error(retval)
    num_speeds[]
end

function number_vs_amplitudes()
    num_amps = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberVSAmplitudes(num_amps)
    check_error(retval)
    num_amps[]
end

function number_vs_speeds()
    num_speeds = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberVSSpeeds(num_speeds)
    check_error(retval)
    num_speeds[]
end

function pixel_size()
    x = Ref{Cfloat}()
    y = Ref{Cfloat}()
    retval = LibAndorSDK2.GetPixelSize(x, y)
    check_error(retval)
    (x[], y[])
end

function pre_amp_gain(index)
    gain = Ref{Cfloat}()
    retval = LibAndorSDK2.GetPreAmpGain(index, gain)
    check_error(retval)
    gain[]
end

function readout_time()
    time = Ref{Cfloat}()
    retval = LibAndorSDK2.GetReadOutTime(time)
    check_error(retval)
    time[]
end

function shutter_min_times()
    min_close = Ref{Cfloat}()
    min_open = Ref{Cfloat}()
    retval = LibAndorSDK2.GetShutterMinTimes(min_close, min_open)
    check_error(retval)
    (min_close[], min_open[])
end

@enumx Status::Cint begin
    IDLE = LibAndorSDK2.DRV_IDLE
    TEMPCYCLE = LibAndorSDK2.DRV_TEMPCYCLE
    ACQUIRING = LibAndorSDK2.DRV_ACQUIRING
    ACCUM_TIME_NOT_MET = LibAndorSDK2.DRV_ACCUM_TIME_NOT_MET
    KINETIC_TIME_NOT_MET = LibAndorSDK2.DRV_KINETIC_TIME_NOT_MET
    ERROR_ACK = LibAndorSDK2.DRV_ERROR_ACK
    ACQ_BUFFER = LibAndorSDK2.DRV_ACQ_BUFFER
    ACQ_DOWNFIFO_FULL = LibAndorSDK2.DRV_ACQ_DOWNFIFO_FULL
    SPOOL_ERROR = LibAndorSDK2.DRV_SPOOLERROR
end

function status()
    status = Ref{Cint}()
    retval = LibAndorSDK2.GetStatus(status)
    check_error(retval)
    Status.T(status[])
end

function image!(hbin, vbin, hstart, hend, vstart, vend)
    retval = LibAndorSDK2.SetImage(hbin, vbin, hstart, hend, vstart, vend)
    check_error(retval)
end

function isolated_crop_mode!(active::Bool, height, width, vbin, hbin)
    retval = LibAndorSDK2.SetIsolatedCropMode(Integer(active), height, width, vbin, hbin)
    check_error(retval)
end

function kinetic_cycle_time!(time)
    retval = LibAndorSDK2.SetKineticCycleTime(time)
    check_error(retval)
end

function output_amplifier!(type)
    retval = LibAndorSDK2.SetOutputAmplifier(type)
    check_error(retval)
end

function photon_counting!(state::Bool)
    retval = LibAndorSDK2.SetPhotonCounting(state)
    check_error(retval)
end

function photon_counting_threshold!(min, max)
    retval = LibAndorSDK2.SetPhotonCountingThreshold(min, max)
    check_error(retval)
end

function pre_amp_gain!(index)
    retval = LibAndorSDK2.SetPreAmpGain(index)
    check_error(retval)
end

@enumx ReadMode::Cint begin
    FVB = 0
    MULTI_TRACK = 1
    RANDOM_TRACK = 2
    SINGLE_TRACK = 3
    IMAGE = 4
end

function read_mode!(mode::ReadMode.T)
    retval = LibAndorSDK2.SetReadMode(Integer(mode))
    check_error(retval)
end

@enumx ShutterSignalType::Cint begin
    ACTIVE_LOW = 0
    ACTIVE_HIGH = 1
end

@enumx ShutterMode::Cint begin
    AUTO = 0
    OPEN = 1
    CLOSED = 2
    OPEN_FVB = 4
    OPEN_ANY = 5
end

function shutter!(type, mode, closing_time, opening_time)
    retval = LibAndorSDK2.SetShutter(type, mode, closing_time, opening_time)
    check_error(retval)
end

function shutter_ex!(type, mode, closing_time, opening_time, ext_mode)
    retval = LibAndorSDK2.SetShutterEx(type, mode, closing_time, opening_time, ext_mode)
    check_error(retval)
end

# function shutter!(type::ShutterSignalType.T, mode::ShutterMode.T, closing_time, opening_time)
#     retval = LibAndorSDK2.SetShutter(Integer(type), Integer(mode), closing_time, opening_time)
#     check_error(retval)
# end

# function shutter_ex!(type::ShutterSignalType.T, mode::ShutterMode.T, closing_time, opening_time, ext_mode::ShutterMode.T)
#     retval = LibAndorSDK2.SetShutterEx(Integer(type), Integer(mode), closing_time, opening_time, Integer(ext_mode))
#     check_error(retval)
# end

function temperature_range()
    min = Ref{Cint}()
    max = Ref{Cint}()
    retval = LibAndorSDK2.GetTemperatureRange(min, max)
    check_error(retval)
    (min[], max[])
end

@enumx CoolingStatus::Cint begin
    OFF = LibAndorSDK2.DRV_TEMP_OFF
    STABILIZED = LibAndorSDK2.DRV_TEMP_STABILIZED
    NOT_REACHED = LibAndorSDK2.DRV_TEMP_NOT_REACHED
    DRIFT = LibAndorSDK2.DRV_TEMP_DRIFT
    NOT_STABILIZED = LibAndorSDK2.DRV_TEMP_NOT_STABILIZED
end

function temperature()
    temp = Ref{Cint}()
    retval = LibAndorSDK2.GetTemperature(temp)
    check_error(retval)
    (temp[], CoolingStatus.T(retval))
end

function temperature!(temperature)
    (min_temp, max_temp) = temperature_range()
    if temperature < min_temp || temperature > max_temp
        throw(ArgumentError("Temperature out of range"))
    end
    retval = LibAndorSDK2.SetTemperature(temperature)
    check_error(retval)
end

@enumx TriggerMode::Cint begin
    INTERNAL = 0
    EXTERNAL = 1
    EXTERNAL_START = 6
    EXTERNAL_EXPOSURE = 7
    EXTERNAL_FVB_EM = 9
    SOFTWARE = 10
    EXTERNAL_CHARGE_SHIFTING = 12
end

function trigger_mode!(mode::TriggerMode.T)
    retval = LibAndorSDK2.SetTriggerMode(Cint(mode))
    check_error(retval)
end

function trigger_mode()
    mode = Ref{Cint}()
    retval = LibAndorSDK2.GetTriggerMode(mode)
    check_error(retval)
    TriggerMode.T(mode[])
end

function vss_speed(index)
    speed = Ref{Cfloat}()
    retval = LibAndorSDK2.GetVSSpeed(index, speed)
    check_error(retval)
    speed[]
end

function number_vss_speeds()
    num_speeds = Ref{Cint}()
    retval = LibAndorSDK2.GetNumberVSSpeeds(num_speeds)
    check_error(retval)
    num_speeds[]
end

function is_cooler_on()
    status = Ref{Cint}()
    retval = LibAndorSDK2.IsCoolerOn(status)
    check_error(retval)
    status[] == 1
end

function current_camera!(handle)
    retval = LibAndorSDK2.SetCurrentCamera(handle)
    check_error(retval)
end

mutable struct Camera
    handle::Clong
    width::Int
    height::Int
    num_pixels::Int
    function Camera(location::AbstractString, index::Int64)
        num_cameras = Ref{Clong}()
        retval = LibAndorSDK2.GetAvailableCameras(num_cameras)
        check_error(error_code)

        if index > num_cameras[]
            throw(AndorSdk2Error("Camera index out of range"))
        end

        handle = Ref{Clong}()
        retval = LibAndorSDK2.GetCameraHandle(index, handle)
        check_error(error_code)

        lock(sdk_lock) do
            retval = LibAndorSDK2.SetCurrentCamera(handle[])
            check_error(retval)

            initialize(location)

            try
                (width, height) = detector()
                return finalize(new(handle[], width, height, width * height)) do camera
                    lock_and_select_camera(camera) do
                        shutdown()
                    end
                end
            catch
                shutdown()
            end
        end
    end
end

Camera(index::Int64) = Camera(joinpath(AndorSDK2_jll.artifact_dir, "share", "AndorSDK2"), index)

const sdk_lock = ReentrantLock()

function lock_and_select_camera(c::Camera, f::Function)
    lock(c.lock) do
        retval = LibAndorSDK2.SetCurrentCamera(c.handle)
        check_error(retval)
        f()
    end
end

end # module