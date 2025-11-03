cmake -G Ninja -S . -B Build/MacOs_arm64 -DCMAKE_INSTALL_PREFIX=Install/MacOs_arm64 -DCMAKE_POLICY_VERSION_MINIMUM=3.5
cmake --build Build/MacOs_arm64 --config Release --parallel
cmake --install Build/MacOs_arm64 --config Release