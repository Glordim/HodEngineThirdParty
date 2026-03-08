cmake -G Ninja -S . -B Build/MacOs_arm64 -DCMAKE_INSTALL_PREFIX=Install/MacOs_arm64 -DCMAKE_BUILD_TYPE=Release
cmake --build Build/MacOs_arm64 --parallel
cmake --install Build/MacOs_arm64