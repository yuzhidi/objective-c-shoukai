/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#import <Foundation/NSGarbageCollector.h>
#import <objc/objc-auto.h>
#import <stdio.h>
#import <libc.h>
#import "Chunk.h"

#define LOOP    3
#define WEAKS   2

Chunk *g = nil;           /* Global */
__weak Chunk *wa[WEAKS];  /* weak reference */

static void func(void)
{
    static id s = nil;
    id f;
    int i;

    g = [[Chunk alloc] initWithLabel:"Global"];
    [g setTarget: [[Chunk alloc] initWithLabel:"Global Ivar"]];
    s = [[Chunk alloc] initWithLabel:"Static var"];
    f = [[Chunk alloc] initWithLabel:"Stack in func"];
    for (i = 0; i < WEAKS; i++) {
        if (wa[i] == nil)
            wa[i] = [[Chunk alloc] initWithLabel:"Weak Reference"];
    }
}

int main(void)
{
    int i;
    id m;

//  objc_startCollectorThread(); /* Collector on dedicated thread */
    for (i = 1; i <= LOOP; i++) {
        [Chunk setGroup: i];
        m = [[Chunk alloc] initWithLabel:"Stack"];
        func();
        printf("------\n");
        [[NSGarbageCollector defaultCollector] collectIfNeeded];
        sleep(1);
    }
    printf("======\n");
    [[NSGarbageCollector defaultCollector] collectExhaustively];
    return 0;
}
