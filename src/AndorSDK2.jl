module AndorSDK2

include("LibAndorSDK2.jl")
using .LibAndorSDK2

include("exceptions.jl")

mutable struct Camera
    handle::Ptr{Cint}
    width::Int
    height::Int
    num_pixels::Int
    function Handle(location::AbstractString, index::Int)        
        num_cameras = Ref{Cint}()
        retval = LibAndorSDK2.GetAvailableCameras(num_cameras)
        check_error(error_code)

        if index > num_cameras[]
            throw(AndorSdk2Error("Camera index out of range"))
        end

        handle = Ref{Cint}()
        retval = LibAndorSDK2.GetCameraHandle(index, handle)
        check_error(error_code)

        retval = LibAndorSDK2.SetCurrentCamera(handle[])
        check_error(error_code)

        retval = LibAndorSDK2.Initialize(location)
        check_error(error_code)

        try
            serial_number = Ref{Cint}()
            retval = LibAndorSDK2.GetCameraSerialNumber(serial_number)
            check_error(error_code)

            width = Ref{Cint}()
            height = Ref{Cint}()
            retval = LibAndorSDK2.GetDetector(width, height)
            check_error(error_code)

            cooler_state = Ref{Cint}()
            retval = LibAndorSDK2.IsCoolerOn(cooler_state)
            check_error(error_code)
        catch
            LibAndorSDK2.ShutDown()
        end

        new(handle[], width[], height[], width[] * height[])
    end
end

function initialize(dir::AbstractString)
    retval = LibAndorSDK2.Initialize(dir)
    check_error(retval)
end

initialize() = initialize(joinpath(AndorSDK2_jll.artifact_dir, "share", "AndorSDK2"))

function abort_acquisition(c::Camera)
    retval = LibAndorSDK2.AbortAcquisition()
    check_error(retval)
end

function cancel_wait()
    retval = LibAndorSDK2.CancelWait()
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

function acquired_data(::Type{Int32}, size)
    data = Array{Clong}(undef, size)
    retval = LibAndorSDK2.GetAcquiredData(data, size)
    check_error(retval)
    data
end

function acquired_data(::Type{UInt16}, size)
    data = Array{WORD}(undef, size)
    retval = LibAndorSDK2.GetAcquiredData16(data, size)
    check_error(retval)
    data
end

function acquired_data(::Type{Float32}, size)
    data = Array{Float32}(undef, size)
    retval = LibAndorSDK2.GetAcquiredFloatData(data, size)
    check_error(retval)
    data
end

function acquired_data(T)
    x, y = detector()
    acquired_data(T, x * y)
end

acquired_data() = acquired_data(UInt16)

function get_acquisition_progress()
    acc = Ref{Clong}()
    series = Ref{Clong}()
    retval = LibAndorSDK2.GetAcquisitionProgress(acc, series)
    check_error(retval)
    (acc[], series[])
end

function get_acquisition_timings()
    exposure = Ref{Cfloat}()
    accumulate = Ref{Cfloat}()
    kinetic = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAcquisitionTimings(exposure, accumulate, kinetic)
    check_error(retval)
    (exposure[], accumulate[], kinetic[])
end

function get_adjusted_ring_exposure_times(inumTimes)
    fptimes = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAdjustedRingExposureTimes(inumTimes, fptimes)
    check_error(retval)
    fptimes[]
end

function get_amp_description(index)
    name = zeros(UInt8, 65)
    retval = LibAndorSDK2.GetAmpDesc(index, name, length(name))
    check_error(retval)
    return name
end

function get_amp_max_speed(index)
    speed = Ref{Cfloat}()
    retval = LibAndorSDK2.GetAmpMaxSpeed(index, speed)
    check_error(retval)
    speed[]
end

function available_cameras()
    num_cameras = Ref{Cint}()
    retval = LibAndorSDK2.GetAvailableCameras(num_cameras)
    check_error(retval)
    num_cameras[]
end

function get_baseline_clamp()
    state = Ref{Cint}()
    retval = LibAndorSDK2.GetBaselineClamp(state)
    check_error(retval)
    state[]
end

function get_bit_depth(channel)
    depth = Ref{Cint}()
    retval = LibAndorSDK2.GetBitDepth(channel, depth)
    check_error(retval)
    depth[]
end    

function camera_handle(index)
    handle = Ref{Cint}()
    retval = LibAndorSDK2.GetCameraHandle(index, handle)
    check_error(retval)
    handle[]
end

function serial_number()
    serial_number = Ref{Cint}()
    retval = LibAndorSDK2.GetCameraSerialNumber(serial_number)
    check_error(retval)
    serial_number[]
end

function current_camera()
    handle = Ref{Cint}()
    retval = LibAndorSDK2.GetCurrentCamera(handle)
    check_error(retval)
    handle[]
end

function detector()
    width = Ref{Cint}()
    height = Ref{Cint}()
    retval = LibAndorSDK2.GetDetector(width, height)
    check_error(retval)
    (width[], height[])
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



end # module