#!/bin/bash
set -e

# Final cleanup of transformer-engine at runtime
echo "Post-build cleanup: Removing transformer-engine..."

# Remove from all possible locations
pip uninstall -y transformer-engine 2>/dev/null || true
sudo pip uninstall -y transformer-engine 2>/dev/null || true
sudo rm -rf /usr/local/lib/python*/dist-packages/transformer_engine* 2>/dev/null || true
sudo rm -rf ~/.local/lib/python*/site-packages/transformer_engine* 2>/dev/null || true

# Verify it's gone
if python -c "import transformer_engine" 2>/dev/null; then
    echo "WARNING: transformer-engine still present"
else
    echo "SUCCESS: transformer-engine removed"
fi

echo "Post-build complete!"
