cmake_minimum_required (VERSION 3.5)

project(repo3
    VERSION 1.0
)



message("CMAKE_PROJECT_NAME: ${CMAKE_PROJECT_NAME}")
message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")

message("PROJECT_NAME: ${PROJECT_NAME}")
message("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message("PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}")

message("CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")

message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
message("CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
message("CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")





#configurations





# dependencies

# find_package(Repo1 REQUIRED)

# if (NOT TARGET Repo1::library1)
#   message("not find Repo1::library1")
# endif ()

# find_package(Repo2 REQUIRED)

# if (NOT TARGET Repo2::library2)
#   message("not find Repo2::library2")
# endif ()
include (Repo3FindDeps.cmake)


# targets and directories
add_subdirectory(library3)
add_subdirectory(binary3)






# export

set(CMAKE_INSTALL_INCLUDEDIR include)
set(CMAKE_INSTALL_LIBDIR lib)

include(CMakePackageConfigHelpers)
set(install_cmakedir ${CMAKE_INSTALL_LIBDIR}/cmake/repo3)

install(
    TARGETS
        library3
    EXPORT repo3-export
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(
    EXPORT repo3-export
    FILE Repo3Targets.cmake
    NAMESPACE Repo3::
    DESTINATION ${install_cmakedir}
)


write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/Repo3ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY ExactVersion
)


configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Repo3Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Repo3Config.cmake
    INSTALL_DESTINATION ${install_cmakedir}
)


export(
    EXPORT repo3-export
    FILE ${CMAKE_CURRENT_BINARY_DIR}/Repo3Targets.cmake
    NAMESPACE Repo3::
)

export(PACKAGE Repo3)



#
# Packaging.
#

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

include(CPack)
