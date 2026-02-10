#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "slang::slang-glslang" for configuration "Release"
set_property(TARGET slang::slang-glslang APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(slang::slang-glslang PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libslang-glslang-2025.24.2.dylib"
  IMPORTED_NO_SONAME_RELEASE "TRUE"
  )

list(APPEND _cmake_import_check_targets slang::slang-glslang )
list(APPEND _cmake_import_check_files_for_slang::slang-glslang "${_IMPORT_PREFIX}/lib/libslang-glslang-2025.24.2.dylib" )

# Import target "slang::slang-glsl-module" for configuration "Release"
set_property(TARGET slang::slang-glsl-module APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(slang::slang-glsl-module PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libslang-glsl-module-2025.24.2.dylib"
  IMPORTED_NO_SONAME_RELEASE "TRUE"
  )

list(APPEND _cmake_import_check_targets slang::slang-glsl-module )
list(APPEND _cmake_import_check_files_for_slang::slang-glsl-module "${_IMPORT_PREFIX}/lib/libslang-glsl-module-2025.24.2.dylib" )

# Import target "slang::slang" for configuration "Release"
set_property(TARGET slang::slang APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(slang::slang PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libslang-compiler.0.2025.24.2.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libslang-compiler.0.2025.24.2.dylib"
  )

list(APPEND _cmake_import_check_targets slang::slang )
list(APPEND _cmake_import_check_files_for_slang::slang "${_IMPORT_PREFIX}/lib/libslang-compiler.0.2025.24.2.dylib" )

# Import target "slang::slangc" for configuration "Release"
set_property(TARGET slang::slangc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(slang::slangc PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/slangc"
  )

list(APPEND _cmake_import_check_targets slang::slangc )
list(APPEND _cmake_import_check_files_for_slang::slangc "${_IMPORT_PREFIX}/bin/slangc" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
