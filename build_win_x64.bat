cmake -G Ninja -S . -B Build/Win_x64 -DCMAKE_INSTALL_PREFIX=Install/Win_x64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5
cmake --build Build/Win_x64 --parallel
cmake --install Build/Win_x64