#!/bin/bash

if [ ! -d "$HOME/miniconda" ]; then
    curl -0 https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh > "$HOME/miniconda.sh"
    bash $HOME/miniconda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    echo "export PATH=$HOME/miniconda/bin:$PATH" >> ~/.bashrc
fi


