
function run_pheno(config_file::String)
    cmd = `julia run_program.jl --phenotype --config $config_file`
    run(cmd)
end
if abspath(PROGRAM_FILE) == @__FILE__
    if length(ARGS) < 1
        println("Usage: julia run_pheno.jl <config_file>")
        exit(1)
    end
    run_pheno(ARGS[1])
end
