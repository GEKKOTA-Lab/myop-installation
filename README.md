# Repositories Referenced
  - [MYOP](https://github.com/ayoshiaki/myop)
  - [MYOP Templates](https://github.com/ayoshiaki/myopTemplates)
  - [ToPS](https://github.com/ayoshiaki/tops)
  - [segseq](https://github.com/ayoshiaki/segseq)
# Software Requirements
  - Unix Machine
  - [Anaconda](https://www.anaconda.com/docs/getting-started/anaconda/install)
  - [Conda](https://anaconda.org/anaconda/conda)
  - [Haskell](https://www.haskell.org/)
  - [Cabal](https://www.haskell.org/cabal/)
  - [SQLite3](https://www.sqlite.org/): `libsqlite3-dev`
## Installing at Ubuntu/Debian Systems
You can install **Haskell**, **Cabal** and **SQLite3** at Ubuntu/Debian systems with
```
sudo apt update && sudo apt install ghc cabal-install libsqlite3-dev sqlite3
```
# Full Process Install
  - Install the **Software Requirements**
  - Choose a folder, this folder is your `$(pwd)`
  - Get, install and activate Conda environment: 
  ```
curl -O -L https://github.com/GEKKOTA-Lab/myop-installation/raw/main/myop_environment.yml && conda env create -f myop_environment.yml && conda activate myop
```
  - Get and run script to install Myop, ToPS and segseq: 
  ```
curl -O -L https://github.com/GEKKOTA-Lab/myop-installation/raw/main/myop_installation.sh && chmod +x myop_installation.sh && ./myop_installation.sh
```
  - For further uses you must use 
  ```
export PATH="$PATH:$HOME/.cabal/bin:$(pwd)/tops/app:$(pwd)/myop/bin:$(pwd):$(pwd)/myop/scripts"
``` 
  or you can add it this snippet your `~/.bashrc`, `~/.zshrc`, `~/.profile` or `~/.bash_profile` depending of what you're using. Substitute the `$(pwd)` with the full path of where the folder you ran the script is.
# Executing the Training
  - You can execute the training with
  ```
myop-train.pl -g <path/to/the/gtf/file> -f <path/to/the/fasta/file> -o output/
```
