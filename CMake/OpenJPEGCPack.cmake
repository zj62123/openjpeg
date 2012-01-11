# package bundler
if(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
  if(EXISTS "${CMAKE_ROOT}/Modules/InstallRequiredSystemLibraries.cmake")
    set(CMAKE_INSTALL_MFC_LIBRARIES 0)
    set(CMAKE_INSTALL_DEBUG_LIBRARIES 0)
    if(NOT DEFINED CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_NO_WARNINGS)
      set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_NO_WARNINGS ON)
    endif()
    include(${CMAKE_ROOT}/Modules/InstallRequiredSystemLibraries.cmake)
  endif(EXISTS "${CMAKE_ROOT}/Modules/InstallRequiredSystemLibraries.cmake")

  set(OPJ_PACKAGE_DESCRIPTION_SUMMARY "OpenJPEG - OpenJPEG a JPEG 2000 implementation.")
  set(OPJ_PACKAGE_CONTACT "openjpeg users <openjpeg@googlegroups.com>")

  set(CPACK_PACKAGE_DESCRIPTION_SUMMARY ${OPJ_PACKAGE_DESCRIPTION_SUMMARY})
  set(CPACK_PACKAGE_VENDOR           "OpenJPEG Team")
  #set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/LICENSE"
    "${CMAKE_CURRENT_BINARY_DIR}/LICENSE.txt" COPYONLY
    )
  # For PackageMaker on MacOSX it is important to have a file extension:
  set(CPACK_RESOURCE_FILE_LICENSE    "${CMAKE_CURRENT_BINARY_DIR}/LICENSE.txt")
  set(CPACK_PACKAGE_VERSION_MAJOR    "${OPENJPEG_VERSION_MAJOR}")
  set(CPACK_PACKAGE_VERSION_MINOR    "${OPENJPEG_VERSION_MINOR}")
  set(CPACK_PACKAGE_VERSION_PATCH    "${OPENJPEG_VERSION_BUILD}")
  set(CPACK_PACKAGE_INSTALL_DIRECTORY "OpenJPEG ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}")
  set(CPACK_SOURCE_PACKAGE_FILE_NAME  "openjpeg-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}")

  set(CPACK_BUNDLE_ICON "${CMAKE_CURRENT_SOURCE_DIR}/CMake/opj_logo.icns")
  set(CPACK_BUNDLE_NAME "OpenJPEG ${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}")
  configure_file(${CMAKE_ROOT}/Templates/AppleInfo.plist
    ${CMAKE_CURRENT_BINARY_DIR}/opj.plist)
  SET(CPACK_BUNDLE_PLIST
    ${CMAKE_CURRENT_BINARY_DIR}/opj.plist)
  #include(BundleUtilities)

  include(CPack)
endiF(EXISTS "${CMAKE_ROOT}/Modules/CPack.cmake")
