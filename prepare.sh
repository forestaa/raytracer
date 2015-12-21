#!/bin/bash

COM=../unicaml # the root dir of the compiler
ASM=../suiteki # the root dir of the assembler
SIM=../../simulator # the root dir of the simulator

echo 'Building compiler...'
cd $COM
make byte-code
cd -> /dev/null

echo 'Building assembla...'
cd $ASM
cabal build
cd - > /dev/null

echo 'Building simulator...'
cd $SIM
make
cd -> /dev/null

echo 'Creating symbolic links for make...'
ln -sf $COM/unicaml ./unicaml
ln -sf $ASM/dist/build/suiteki/suiteki ./suiteki
ln -sf $ASM/lib ./lib
ln -sf $SIM/sim ./sim
