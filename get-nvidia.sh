#!/bin/bash
VERSION=$(curl -s https://raw.githubusercontent.com/aaronp24/nvidia-versions/master/nvidia-versions.txt | grep "current official" | cut -f 3 -d " ")
FILE="NVIDIA-Linux-x86_64-${VERSION}.run"

download_driver () {
    if [ -f "${FILE}" ]; then
        echo "${FILE} already exists..."
    else
        echo "Downloading latest NVIDIA driver version: ${VERSION}"
        echo "  URL: http://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/${FILE}"
        curl -o ${FILE} http://us.download.nvidia.com/XFree86/Linux-x86_64/${VERSION}/${FILE}
        chmod +x ${FILE}
        driver_check
    fi
}

driver_check () {
    FILECHECK=$(./${FILE} --check)
    if [ "$FILECHECK" = "check sums and md5 sums are ok" ]; then
        echo "${FILE} integrity verified!"
    else
        echo "Integrity check failed, removing and reattempting download..."
        rm ${FILE}
        download_driver
    fi
}

download_driver
