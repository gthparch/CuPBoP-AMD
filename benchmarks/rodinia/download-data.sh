#!/bin/bash

RODINIA_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
RODINIA_VER="rodinia_3.1"
RODINIA_AR="http://www.cs.virginia.edu/~skadron/lava/Rodinia/Packages/$RODINIA_VER.tar.bz2"
RODINIA_EX_DIR="$RODINIA_DIR/rodinia-data"

pushd "$RODINIA_DIR"

echo "[*] Downloading $RODINIA_VER..."
wget -O "$RODINIA_VER.tar.bz2" "$RODINIA_AR"
mkdir -p "$RODINIA_EX_DIR"

echo "[*] Extracting to $RODINIA_EX_DIR..."
tar --strip-components=2 -C "$RODINIA_EX_DIR" -xf "$RODINIA_VER.tar.bz2" "$RODINIA_VER/data"

echo "[*] Cleaning up..."
rm -f "$RODINIA_VER.tar.bz2"

popd
