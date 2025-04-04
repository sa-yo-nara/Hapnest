module SynteticData

# Funzione generate genotype
function generate_geno(threads::String, config::String)
    # Costruisci il percorso dello script bash
    script_path = joinpath(dirname(@__FILE__), "scripts", "generate_geno.sh")
    
    # Esegui lo script bash passando i due argomenti
    run(`bash $script_path $threads $config`)
end


# Funzione generate phenotype
function generate_pheno(config::String)
    # Costruisci il percorso dello script bash
    script_path = joinpath(dirname(@__FILE__), "scripts", "generate_pheno.sh")
    
    # Esegui lo script bash passando i due argomenti
    run(`bash $script_path $config`)

end


# fetch dei dati
function fetch(data_dir::String)
    script_path = joinpath(dirname(@__FILE__), "scripts", "fetch.sh")
    run(`bash $script_path $data_dir`)
end
end