#!/bin/bash

# Install Go
sudo apt update
sudo apt install golang-go

# Clone Syzkaller
git clone https://github.com/google/syzkaller.git
cd syzkaller
make

echo "Syzkaller installed successfully."
