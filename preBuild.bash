#!/bin/bash
set -e

# Install PyTorch with CUDA support from the correct index
echo "Installing PyTorch with CUDA 11.8 support..."
pip install --user torch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118

# Set environment variable to prevent transformer-engine conflicts
export USE_FP8=0

echo "PyTorch installation complete!"
echo "Torch version: $(python -c 'import torch; print(torch.__version__)')"
echo "CUDA available: $(python -c 'import torch; print(torch.cuda.is_available())')"
