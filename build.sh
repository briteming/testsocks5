#!/bin/bash

if [ $# -ne 1 ]; then
    echo "./build.sh version"
    exit
fi

mkdir _

deno compile -A --unstable --target x86_64-unknown-linux-gnu -o _/testsocks5_linux_amd64 https://raw.githubusercontent.com/brook-community/testsocks5/master/testsocks5.js
deno compile -A --unstable --target x86_64-apple-darwin -o _/testsocks5_darwin_amd64 https://raw.githubusercontent.com/brook-community/testsocks5/master/testsocks5.js
deno compile -A --unstable --target x86_64-pc-windows-msvc -o _/testsocks5_windows_amd64 https://raw.githubusercontent.com/brook-community/testsocks5/master/testsocks5.js

nami release github.com/brook-community/testsocks5 $1 _

rm -rf _
