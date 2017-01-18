/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import <Foundation/NSObject.h>
#import <Foundation/NSGarbageCollector.h>
#import <objc/objc-auto.h>
#import <stdio.h>
#import <stdlib.h>
#import <libc.h>
#define MASS    200000 /* 100000 for 10.6 */
#define LOOP    3

@interface Chunk : NSObject
{
    int group;
    id  target;
    char mass[MASS];
}
+ (void)setGroup:(int)n;
- (id)initWithLabel:(const char *)lab;
- (void)setTarget:(id)obj;
- (void)finalize;
@end

@implementation Chunk

static int grpnum = 0;

+ (void)setGroup:(int)n { grpnum = n; }

- (id)initWithLabel:(const char *)lab
{
    self = [super init];
    group = grpnum;
    target = nil;
    strcpy(mass, lab);
    return self;
}

- (void)setTarget:(id)obj { target = obj; }

- (void)finalize {
    printf("%d %s\n", group, mass);
    [super finalize];
}

@end

struct pac {
    id obj;
};

Chunk *g = nil;               /* Global */
__weak Chunk *wa = NULL;      /* weak reference */
struct pac *cp, *mp;          /* C-style struct */
__strong struct pac *sp;      /* struct with __strong */

static void func(void)
{
    static id s = nil;
    id f;

    g = [[Chunk alloc] initWithLabel:"Global"];
    [g setTarget: [[Chunk alloc] initWithLabel:"Global Ivar"]];
    s = [[Chunk alloc] initWithLabel:"Static var"];
    f = [[Chunk alloc] initWithLabel:"Auto in func"];
    if (wa == nil)
        wa = [[Chunk alloc] initWithLabel:"Weak Reference"];
    cp = NSAllocateCollectable(sizeof(struct pac), NSScannedOption);
    cp->obj = [[Chunk alloc] initWithLabel:"Struct"];
    mp = (struct pac *)malloc(sizeof(struct pac));
    mp->obj = [[Chunk alloc] initWithLabel:"Malloc Struct"];
    sp = NSAllocateCollectable(sizeof(struct pac), NSScannedOption);
    sp->obj = [[Chunk alloc] initWithLabel:"Strong Struct"];
}

int main(void)
{
    int i;
    id m;

//  objc_startCollectorThread(); /* Collector on dedicated thread */
    for (i = 1; i <= LOOP; i++) {
        [Chunk setGroup: i];
        m = [[Chunk alloc] initWithLabel:"Auto in main"];
        func();
        printf("------\n");
        [[NSGarbageCollector defaultCollector] collectIfNeeded];
        sleep(1);
    }
    printf("======\n");
    [[NSGarbageCollector defaultCollector] collectExhaustively];
    return 0;
}
