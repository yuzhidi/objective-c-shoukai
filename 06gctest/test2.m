/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#import <Foundation/NSGarbageCollector.h>
#import <objc/objc-auto.h>
#import <stdio.h>
#import <libc.h>
#import "Chunk.h"

#define LOOP    3

struct pac {
    struct pac __strong *s;
    struct pac *p;
    id obj;
};

static __strong struct pac *newPac(id w) {
    __strong struct pac *pp;
    pp = NSAllocateCollectable(sizeof(struct pac), NSScannedOption);
    pp->s = NULL;
    pp->p = NULL;
    pp->obj = w;
    return pp;
}

struct pac *cp, *mp;          /* C-style struct */
__strong struct pac *sp;      /* struct with __strong */
__weak struct pac *wp = NULL; /* struct with __weak */

static void func(void)
{
    cp = newPac([[Chunk alloc] initWithLabel:"CollectableStruct"]);
    mp = (struct pac *)malloc(sizeof(struct pac));
    mp->obj = [[Chunk alloc] initWithLabel:"MallocStruct"];
    sp = newPac([[Chunk alloc] initWithLabel:"StrongStruct"]);
    sp->s = newPac([[Chunk alloc] initWithLabel:"StrongStruct->s"]);
    sp->p = newPac([[Chunk alloc] initWithLabel:"StrongStruct->p"]);
    if (wp == nil) {
        wp = newPac([[Chunk alloc] initWithLabel:"WeakStruct"]);
        wp->s = newPac([[Chunk alloc] initWithLabel:"WeakStruct->s"]);
        wp->p = newPac([[Chunk alloc] initWithLabel:"WeakStruct->p"]);
    }
}

int main(void)
{
    int i;

//  objc_startCollectorThread(); /* Collector on dedicated thread */
    for (i = 1; i <= LOOP; i++) {
        [Chunk setGroup: i];
        func();
        printf("------\n");
        [[NSGarbageCollector defaultCollector] collectIfNeeded];
        sleep(1);
    }
    printf("======\n");
    [[NSGarbageCollector defaultCollector] collectExhaustively];
    return 0;
}
