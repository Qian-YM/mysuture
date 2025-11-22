#!/bin/bash

cd benchmark
./gen.sh $1
cd ..

./run_nohup.sh benchmark/$1.bc benchmark/conf_$1

rm res
ln -s benchmark/conf_$1.log ./res
