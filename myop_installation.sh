#!/bin/bash

rm -r tops
rm -r myop
rm -r segseq
rm -r myopTemplates
rm -r output

git clone https://github.com/ayoshiaki/tops -b master
git clone https://github.com/ayoshiaki/myop
git clone https://github.com/ayoshiaki/segseq.git
git clone https://github.com/ayoshiaki/myopTemplates -b master

find . -name "CMakeLists.txt" -exec sed -i 's/cmake_minimum_required(VERSION 2\.6)/cmake_minimum_required(VERSION 3.5)/' {} \;
sed -i 's/set(Boost_USE_STATIC_LIBS ON)/set(Boost_USE_STATIC_LIBS OFF)\nset(Boost_USE_STATIC_RUNTIME OFF)/' tops/CMakeLists.txt
sed -i 's/set(Boost_USE_STATIC_LIBS ON)/set(Boost_USE_STATIC_LIBS OFF)\nset(Boost_USE_STATIC_RUNTIME OFF)/' myop/CMakeLists.txt
sed -i 's/L\.putStrLn bytes/L.putStr bytes >> putStrLn ""/g' segseq/src/segseq.hs
sed -i 's/L\.putStrLn bytes/L.putStr bytes >> putStrLn ""/g' segseq/segseq.hs


cd segseq
cabal install .

export PATH="$PATH:$HOME/.cabal/bin:$(pwd)/tops/app:$(pwd)/myop/bin:$(pwd):$(pwd)/myop/scripts"

cd ../tops
cmake .
make -j4
ln -s ./app/tops-evaluate ./app/evaluate
cd ..
chmod +x myop/scripts/*

mkdir output
cp -r ./myopTemplates/cnf/ ./output/
cp -r ./myopTemplates/scripts/ ./output/
