/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#include <stdio.h>
#include <stdlib.h>
#include "speed.h"

typedef struct _cell {
    struct _cell *next;
    char mass[MASS];
} cell;

cell *buf[ARRAYSIZE];

cell *initWithNext(cell *obj) {
    cell *p = malloc(sizeof(cell));
    p->next = obj;
    return p;
}

void dealloc(cell *p) {
    if (p->next)
        dealloc(p->next);
    free(p);
}

int main(void)
{
    int i, j;

    srandom(SEED);
    for (i = 0; i < LOOP; i++) {
        for (j = 0; j < LOOP; j++) {
            int idx = random() & ARRAYMASK;
            if (buf[idx] != NULL && (random() & ACCIDENT) == 0) {
                dealloc(buf[idx]);
                buf[idx] = NULL;
            }else {
                cell *t = buf[idx];
                buf[idx] = initWithNext(t);
            }
        }
    }
    return 0;
}
