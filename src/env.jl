using Pkg
using Conda

Pkg.add([
    "ArgParse", "CSV", "CategoricalArrays", "Conda", "DataFrames",
    "DelimitedFiles", "Distances", "Distributions", "GpABC", "Impute",
    "LsqFit", "MendelPlots", "Mmap", "Plots", "Printf", "ProgressMeter",
    "PyCall", "StatsBase", "StatsPlots", "YAML"
])

Conda.add("python"); ENV["PYTHON"] = ""; Pkg.build("PyCall"); Pkg.instantiate(); using Conda; Conda.add("bed-reader")

Pkg.instantiate()
println("All packages installed successfully!")
