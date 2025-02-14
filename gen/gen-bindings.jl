using Clang.Generators

using AndorSDK2_jll

cd(@__DIR__)

include_dir = joinpath(AndorSDK2_jll.artifact_dir, "include")

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$include_dir")

headers = [joinpath(include_dir, header) for header in readdir(include_dir) if endswith(header, ".h")]

ctx = create_context(headers, args, options)

# run generator
build!(ctx)
