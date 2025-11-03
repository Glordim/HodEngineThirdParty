cmake -G Ninja -S . -B Build/Win_arm64 -DCMAKE_INSTALL_PREFIX=Install/Win_arm64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5
cmake --build Build/Win_arm64 --parallel
cmake --install Build/Win_arm64