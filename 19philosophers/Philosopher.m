/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "Philosopher.h"
#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <unistd.h> // for getpid()

static NSLock *sharedLock = nil;
static const char *phil_Meditation = "Meditation";
static const char *phil_WaitRight = "WaitRight";
static const char *phil_Eating = "Eating";

@implementation Philosopher

@synthesize tag, state;

+ (void)initialize
{
    if (sharedLock == nil) {
        sharedLock = [[NSLock alloc] init];
        srandom(getpid());
    }
}

- (id)initWithLeft:(id <NSLocking>)llock right:(id <NSLocking>)rlock;
{
    if ((self = [super init]) != nil) {
        leftLock = llock;
        rightLock = rlock;
        tag = 0;
        state = phil_Meditation;
    }
    return self;
}

static void waitAMoment(int r) {
    int n = r * r;
    while (n-- > 0) ;
}

- (void)start:(id)sender
{
    int rnd = tag * 50;

    while ( 1 ) @autoreleasepool {
        [leftLock lock];
        state = phil_WaitRight;
        waitAMoment(rnd);
        [rightLock lock];

        state = phil_Eating;
        [sharedLock lock];
        // random() and printf() are thread-unsafe.
        rnd = random() % 1000 + 1;
        printf("Philosopher #%d\n", tag);
        [sharedLock unlock];

        [leftLock unlock];
        [rightLock unlock];
        state = phil_Meditation;
        waitAMoment(rnd);
    }
}

@end
