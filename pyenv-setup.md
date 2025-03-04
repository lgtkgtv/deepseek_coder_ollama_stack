# 1 - Install pyenv (if not already installed)

```sh
sudo apt-get update
sudo apt-get install -y curl git make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
libxmlsec1-dev libffi-dev liblzma-dev
curl https://pyenv.run | bash
```

# 2 - Then add this to your shell startup file (like ~/.bashrc or ~/.zshrc):

```sh
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

# 3 - Install the Desired Python Version with pyenv

```sh
pyenv install 3.11
```

# 4 - Set Python Version for Your Project Folder

```
cd <project-dir>
pyenv install 3.11  	    Install Python version
pyenv local 3.11 	        Pin version to current folder
python --version	        Verify correct Python version
cat .python-version	        See the pinned version file
git add .python-version
git commit -m "Pin Python version for project"
```

---

# How to add commenst to bash script?

```sh
#!/bin/bash

: << 'COMMENT'
This script does X, Y, Z.
It is part of project Foo.
COMMENT

echo "Hello, World!"
```

