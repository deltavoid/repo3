#include <repo3/library3/public/library3.h>
#include <repo2/library2/public/library2.h>
// #include <repo1/library1/public/library1.h>

#include <stdio.h>




void repo3_library3_display()
{
    printf("repo3_library3_display: 1\n");

    repo2_library2_display();

    printf("repo3_library3_display: 2\n");
}