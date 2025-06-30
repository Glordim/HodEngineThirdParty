cmake -S . -B Build/MacOs_arm64 -DCMAKE_INSTALL_PREFIX=Install/MacOs_arm64
cmake --build Build/MacOs_arm64 --config Release
cmake --install Build/MacOs_arm64 --config Release