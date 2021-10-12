#!/bin/bash
VERSION=$(curl -s https://raw.githubusercontent.com/aaronp24/nvidia-versions/master/nvidia-versions.txt | grep "current official" | cut -f 3 -d " ")
echo "Downloading latest NVIDIA driver version: ${VERSION}"
echo "  URL: http://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/NVIDIA-Linux-x86_64-${VERSION}.run"
curl -o NVIDIA-Linux-x86_64-${VERSION}.run http://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/NVIDIA-Linux-x86_64-${VERSION}.run
chmod +x NVIDIA-Linux-x86_64-${VERSION}.run
