#include "util_func.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char gkey()
{

    FILE *fp;
    char key;

    /* Open the command for reading. */
    fp = popen("bash -c '~/.local/bin/readkey.sh'", "r");
    if (fp == NULL) {
        printf("Failed to run command\n");
        exit(1);
    }

    /* Read the output a line at a time - output it. */
    key = fgetc(fp);

    /* close */
    pclose(fp);

    return key;
}

int key_apps(char key, struct App apps[], int n)
{
    for (int i = 0; i < n; i++) {
        if (apps[i].key == key)
            return i;
    }
    return -1;
}

// int main()
// {
//     char key;
//     key = gkey("ls -l");
//     printf("%c\n", key);
//     return 0;
// }
