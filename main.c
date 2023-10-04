#include <stdio.h>

int main() {
    char cpuinfo;
    FILE *fp = fopen("/proc/xcpuinfo", "r");

    if (fp == NULL) {
        fprintf(stderr, "Error opening file\n");
    } else {
        while ((cpuinfo = fgetc(fp)) != EOF) {
            printf("%c", cpuinfo);      
        }
        fclose(fp);
    }

    return 0;
}