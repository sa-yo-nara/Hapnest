
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
