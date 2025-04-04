using Pkg

Pkg.add([
    "ArgParse", "CSV", "CategoricalArrays", "Conda", "DataFrames",
    "DelimitedFiles", "Distances", "Distributions", "GpABC", "Impute",
    "LsqFit", "MendelPlots", "Mmap", "Plots", "Printf", "ProgressMeter",
    "PyCall", "StatsBase", "StatsPlots", "YAML"
])

using Conda; Conda.pip_interop(true); Conda.pip("install", "bed_reader")

Pkg.instantiate()
println("All packages installed successfully!")
function run_geno(threads::String, config_file::String)
    cmd = `julia --threads $threads run_program.jl --genotype --config $config_file`
    run(cmd)
end
if abspath(PROGRAM_FILE) == @__FILE__
    if length(ARGS) < 1
        println("Usage: julia run_geno.jl <config_file>")
        exit(1)
    end
    run_geno(ARGS[1])
end
