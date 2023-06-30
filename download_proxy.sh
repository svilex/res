#!/bin/bash
ARCH="$(dpkg --print-architecture)"
SDK="$(getprop ro.build.version.sdk)"

case $ARCH in
    "aarch64")
        if  [[ $SDK -gt 29 ]]
        then
            LINK="https://raw.githubusercontent.com/svilex/res/master/proxy_arm64_new"
        else
            LINK="https://raw.githubusercontent.com/svilex/res/master/proxy_arm64"
        fi
        ;;
    "arm")
        LINK="https://raw.githubusercontent.com/svilex/res/master/proxy_arm"
        ;;
    *)
        echo "Architecture not supported yet, contact svile"
        exit 1
        ;;
esac

command -v curl >/dev/null 2>&1 || { echo >&2 "Install curl and retry"; exit 1; }

echo "Downloading proxy..."
curl "$LINK" --progress-bar -o proxy && chmod +x proxy && echo "Done! Run it using ./proxy address:port"
