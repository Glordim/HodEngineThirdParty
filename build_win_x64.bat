cmake -S . -B Build/Win_x64 -DCMAKE_INSTALL_PREFIX=Install/Win_x64 -A x64
cmake --build Build/Win_x64 --config Release -- -j
cmake --install Build/Win_x64 --config Release