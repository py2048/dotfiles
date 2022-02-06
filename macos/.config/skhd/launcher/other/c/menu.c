#include "util_func.h"

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void app_menu()
{
    static const struct App apps[] = {
        {.key = 'b', .app = "Brave Browser", .icon = "  "},
        {.key = 'c', .app = "Visual Studio Code", .icon = " ﬏ "},
        {.key = 'd', .app = "Discord", .icon = " ﭮ "},
        {.key = 'k', .app = "KeePassXC", .icon = "  "},
        {.key = 'm', .app = "Messenger", .icon = "  "},
        {.key = 'o', .app = "Obsidian", .icon = "  "},
        {.key = 'p', .app = "Parallels Desktop", .icon = "  "},
        {.key = 's', .app = "System Preferences", .icon = "  "},
        {.key = 't', .app = "Microsoft Teams", .icon = "  "},
        {.key = 'v', .app = "VMware Fusion", .icon = "  "}};
    const int apps_n = sizeof(apps) / sizeof(apps[0]);
    char app_name[55], cmd[70], nl, key;
    int i;
    // char app_name[55], nl, key;

    for (i = 0; i < apps_n; i++) {
        if (i % 2)
            nl = '\n';
        else
            nl = '\0';
        strcpy(app_name, apps[i].app);
        // strcat(app_name, " ");
        strcat(app_name, apps[i].icon);
        printf("    [%c] %-25s%c", toupper(apps[i].key), app_name, nl);
    }

    key = gkey();
    i = key_apps(key, apps, apps_n);
    strcpy(cmd, "open -a \"");
    strcat(cmd, apps[i].app);
    strcat(cmd, "\"");
    system(cmd);
}

int main()
{
    app_menu();
    return 0;
}
