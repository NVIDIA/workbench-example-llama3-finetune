#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it

# The NGC PyTorch base image ships a newer apex without `apex.amp`, which
# transformers 4.41 tries to import (`from apex import amp`) and then fails on.
# torch has native AMP, so apex is not needed here.
sudo -E pip uninstall -y apex || true
