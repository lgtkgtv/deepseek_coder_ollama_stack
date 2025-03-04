#!/bin/bash
set -e

cd garak_test # cd ~/garak_test automatically activates garak-env, no need to manually activate. This is the real magic of pyenv-virtualenv 

pyenv install -s 3.11
pyenv virtualenv -f 3.11 garak-env
pyenv local garak-env

pip install --upgrade pip
pip install garak

python --version  # verify  
pyenv version     # verify 
