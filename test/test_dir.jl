using Test
using YAML
using Random

# Add the src directory to path so we can import necessary functions
push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))

# Import the SynteticData module which contains the generate_pheno function
include(joinpath(@__DIR__, "..", "src", "run_pheno.jl"))

@testset "Phenotype Generation Directory Creation" begin
    # Create a temporary directory for testing
        mktempdir() do test_dir 
        config_path = joinpath("..", "test", "test_config.yaml")
       
        # Create mock input files that generate_pheno would expect
        sample_dir = joinpath(test_dir)
        mkpath(sample_dir)
        open(joinpath(sample_dir, "test-1.sample"), "w") do io
            println(io, "ID_1 ID_2 missing father mother sex phenotype pc1 pc2")
            println(io, "0 0 0 0 0 0 -9 0 0")
            println(io, "sample_1 sample_1 0 0 0 1 -9 0.1 0.2")
        end
        
        # Capture the original output directory state
        original_dirs = Set(readdir(test_dir))
        
        # Run the generate_pheno function 
        try
            include(joinpath(@__DIR__, "..", "src", "run_pheno.jl")), run_pheno(config_path)
        catch e
            # xx
            @info "Note: generate_pheno execution failed with: $e"
        end
        
        # Check what directories were created
        final_dirs = Set(readdir(test_dir))
        new_dirs = setdiff(final_dirs, original_dirs)
        
        @info "Directories created by generate_pheno: $new_dirs"
        
        # Test that the expected directories were created
        @test isdir(joinpath(test_dir, "evaluation")) || 
              any(d -> occursin("evaluation", d), new_dirs)
        @test isdir(joinpath(test_dir, "optimisation")) ||
              any(d -> occursin("optimisation", d), new_dirs)
        @test isdir(joinpath(test_dir, "reference")) ||
              any(d -> occursin("reference", d), new_dirs)
        
      
    end
end