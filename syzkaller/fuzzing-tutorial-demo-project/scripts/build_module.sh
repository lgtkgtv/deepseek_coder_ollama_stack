#!/bin/bash

cd kernel_module
make
sudo insmod vulnerable_module.ko
echo "Kernel module built and installed."
