call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

cmake -G Ninja -S . -B Build/Win_x64 -DCMAKE_INSTALL_PREFIX=Install/Win_x64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_C_COMPILER=cl.exe -DCMAKE_CXX_COMPILER=cl.exe
cmake --build Build/Win_x64 --parallel
cmake --install Build/Win_x64