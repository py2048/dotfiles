#include <sys/stat.h>

long modified_time(const char *path)
{
    struct stat file_stat;
    int error = stat(path, &file_stat);
    if (error) {
        return 0;
    }
    return file_stat.st_mtime;
}

int main(int argc, char *argv[])
{
    const char *src = argv[1];
    const char *bin = argv[2];
    long mod_src = modified_time(src);
    long mod_bin = modified_time(bin);
    if (!mod_bin)
        return 0;
    if (mod_bin - mod_src >= 0)
        return 1;
    return 0;
}
