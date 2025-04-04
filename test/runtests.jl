using Test
using SynteticData

# Definisci i percorsi dei file di configurazione e degli script
config_file = joinpath(dirname(@__FILE__), "config_dl_test.yaml")
threads = "1"  # Numero di thread da utilizzare

# Test per la funzione generate_geno
@testset "Test generate_geno" begin
    @testset "Esecuzione corretta dello script" begin
        # Esegui la funzione e verifica che non generi errori
        @test nothing == SynteticData.generate_geno(threads, config_file)
    end
end
