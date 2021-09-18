

find_package(Repo2 REQUIRED)

if (NOT TARGET Repo2::library2)
  message("not find Repo2::library2")
endif ()

