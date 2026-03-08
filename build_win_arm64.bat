call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

cmake -G Ninja -S . -B Build/Win_arm64 -DCMAKE_INSTALL_PREFIX=Install/Win_arm64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=cl.exe -DCMAKE_CXX_COMPILER=cl.exe
cmake --build Build/Win_arm64 --parallel
cmake --install Build/Win_arm64