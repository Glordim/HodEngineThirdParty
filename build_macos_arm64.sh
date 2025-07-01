cmake -S . -B Build/MacOs_arm64 -DCMAKE_INSTALL_PREFIX=Install/MacOs_arm64
cmake --build Build/MacOs_arm64 --config Release -- -j 8
cmake --install Build/MacOs_arm64 --config Release