module HapSim


# Algorithms
include("scripts/env.jl")
include("scripts/parameter_parsing.jl")
include("scripts/preprocessing.jl")
include("scripts/abc.jl")
include("scripts/genotype_algorithm.jl")
include("scripts/phenotype_algorithm.jl")
include("scripts/evaluation.jl")

# Functions
include("fetch.jl")
include("run_pheno.jl")
include("run_geno.jl")


export run_geno, run_pheno, fetch

end
