#!/bin/sh
set -x
# Generate synthetic genotypes
CURR_DIR=`pwd`
SCRIPT_DIR=$(dirname "$0")
cd $SCRIPT_DIR
julia --threads "$1" ../run_program.jl --genotype --config "$2"
cd $CURR_DIR
