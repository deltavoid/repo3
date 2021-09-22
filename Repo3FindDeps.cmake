

message("Repo3FindDeps.cmake begin")

# find_package(Repo2 REQUIRED)



include(CMakeFindDependencyMacro)


find_dependency(Repo2 REQUIRED)



if (NOT TARGET Repo2::library2)
  message("not find Repo2::library2")
endif ()


message("Repo3FindDeps.cmake end")
