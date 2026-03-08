cmake -G Ninja -S . -B Build/Linux_x64 -DCMAKE_INSTALL_PREFIX=Install/Linux_x64 -DCMAKE_BUILD_TYPE=Release
cmake --build Build/Linux_x64 --parallel
cmake --install Build/Linux_x64