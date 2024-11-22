module AndorSDK2

include("LibAndorSDK2.jl")
import .LibAndorSDK2

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

function abort_acquisition(c::Camera)
    retval = LibAndorSDK2.AbortAcquisition()
    check_error(retval)
end

function cancel_wait()
    retval = LibAndorSDK2.CancelWait()
    check_error(retval)
end





end # module