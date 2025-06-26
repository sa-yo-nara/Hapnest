module HapSim


# Algorithms
include("env.jl")
include("parameter_parsing.jl")
include("preprocessing.jl")
include("abc.jl")
include("genotype_algorithm.jl")
include("phenotype_algorithm.jl")
include("evaluation.jl")
include("fetch.jl")
include("run_pheno.jl")
include("run_geno.jl")


export run_geno, run_pheno, fetch

end
