cmake -S . -B Build/Win_arm64 -DCMAKE_INSTALL_PREFIX=Install/Win_arm64 -A ARM64
cmake --build Build/Win_arm64 --config Release -- -j
cmake --install Build/Win_arm64 --config Release