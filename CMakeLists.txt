cmake_minimum_required(VERSION 3.25)
project(HodEngineThirdParty)
include(ExternalProject)

set(COMMON_CMAKE_ARGS
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
    -DCMAKE_MAKE_PROGRAM:FILEPATH=${CMAKE_MAKE_PROGRAM}
)

if(CMAKE_TOOLCHAIN_FILE)
    list(APPEND COMMON_CMAKE_ARGS -DCMAKE_TOOLCHAIN_FILE:FILEPATH=${CMAKE_TOOLCHAIN_FILE})
endif()

if(ANDROID)
    list(APPEND COMMON_CMAKE_ARGS
        -DANDROID_ABI=${ANDROID_ABI}
        -DANDROID_PLATFORM=${ANDROID_PLATFORM}
    )
endif()

if(APPLE)
    list(APPEND COMMON_CMAKE_ARGS -DCMAKE_OSX_DEPLOYMENT_TARGET=14)
endif()

# Box2d
ExternalProject_Add(Box2d
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Box2d"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Box2d
        -DBOX2D_SAMPLES=OFF
        -DBOX2D_VALIDATE=OFF
        -DBOX2D_UNIT_TESTS=OFF
        -DBOX2D_AVX2=OFF # TODO: crash on Android
)

# Freetype
ExternalProject_Add(Freetype
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Freetype"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Freetype
        -DFT_DISABLE_BROTLI=ON
        -DFT_DISABLE_HARFBUZZ=ON
        -DFT_DISABLE_PNG=ON
        -DFT_DISABLE_BZIP2=ON
        -DFT_DISABLE_ZLIB=ON
)

if(WIN32 OR ANDROID OR LINUX)
    # VulkanMemoryAllocator
    ExternalProject_Add(VulkanMemoryAllocator
        SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/VulkanMemoryAllocator"
        CMAKE_ARGS
            ${COMMON_CMAKE_ARGS}
            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/VulkanMemoryAllocator
            -DVMA_ENABLE_INSTALL=ON
            -DVMA_BUILD_DOCUMENTATION=OFF
    )
endif()

if(NOT ANDROID)
    # Slang
    ExternalProject_Add(Slang
        SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Slang"
        CMAKE_ARGS
            ${COMMON_CMAKE_ARGS}
            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Slang
            -DSLANG_ENABLE_SLANGD=OFF
            -DSLANG_ENABLE_GFX=OFF
            -DSLANG_ENABLE_SLANG_RHI=OFF
            -DSLANG_ENABLE_SLANGI=OFF
            -DSLANG_ENABLE_TESTS=OFF
            -DSLANG_ENABLE_EXAMPLES=OFF
            -DSLANG_ENABLE_REPLAYER=OFF
            -DSLANG_SLANG_LLVM_FLAVOR=DISABLE
    )
endif()

# Fmt
ExternalProject_Add(Fmt
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Fmt"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Fmt
        -DFMT_INSTALL=ON
)

# Gtest
ExternalProject_Add(Gtest
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Gtest"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Gtest
        -Dgtest_force_shared_crt=ON
)

# Benchmark
ExternalProject_Add(Benchmark
    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/Source/Benchmark"
    CMAKE_ARGS
        ${COMMON_CMAKE_ARGS}
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}/Benchmark
        -DBENCHMARK_ENABLE_TESTING=OFF
        -DBENCHMARK_ENABLE_INSTALL=ON
        -DBENCHMARK_INSTALL_DOCS=OFF
        -DBENCHMARK_INSTALL_TOOLS=OFF
)

# Stb (header-only)
install(
    DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Source/Stb/"
    DESTINATION "Stb/include"
    FILES_MATCHING PATTERN "*.h"
)

# PortableFileDialogs (header-only)
install(
    DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Source/PortableFileDialogs/"
    DESTINATION "PortableFileDialogs/include"
    FILES_MATCHING PATTERN "*.h"
)

if(WIN32)
    # WindowsHModular (header-only)
    install(
        DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Source/WindowsHModular/include/win32"
        DESTINATION "WindowsHModular/include"
        FILES_MATCHING PATTERN "*.h"
    )
endif()

if(APPLE)
    # MetalCpp (downloaded at configure time)
    ExternalProject_Add(MetalCpp
        URL https://developer.apple.com/metal/cpp/files/metal-cpp_macOS15.2_iOS18.2.zip
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND ""
        SOURCE_DIR ${CMAKE_BINARY_DIR}/metal-cpp-src
    )

    ExternalProject_Get_Property(MetalCpp SOURCE_DIR)

    install(
        DIRECTORY ${SOURCE_DIR}/Metal
        DESTINATION "MetalCpp/include"
        FILES_MATCHING PATTERN "*.hpp"
    )
    install(
        DIRECTORY ${SOURCE_DIR}/Foundation
        DESTINATION "MetalCpp/include"
        FILES_MATCHING PATTERN "*.hpp"
    )
    install(
        DIRECTORY ${SOURCE_DIR}/QuartzCore
        DESTINATION "MetalCpp/include"
        FILES_MATCHING PATTERN "*.hpp"
    )
endif()
