/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import "Philosopher.h"
#import <Foundation/Foundation.h>
#import <stdlib.h>
#import <unistd.h> // for getpid()

static id sharedLock = nil;
static const char *phil_Meditation = "Meditation";
static const char *phil_WaitRight = "WaitRight";
static const char *phil_Eating = "Eating";

@implementation Philosopher

@synthesize tag, state;

+ (void)initialize
{
    if (sharedLock == nil) {
        sharedLock = [[NSObject alloc] init];
        srandom(getpid());
    }
}

- (id)initWithLeft:(id)llock right:(id)rlock;
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
        @synchronized(leftLock) {
            state = phil_WaitRight;
            waitAMoment(rnd);
            @synchronized(rightLock) {
                state = phil_Eating;
                @synchronized(sharedLock) {
                    // random() and printf() are thread-unsafe.
                    rnd = random() % 1000 + 1;
                    printf("Philosopher #%d\n", tag);
                }
            }
        }
        state = phil_Meditation;
        waitAMoment(rnd);
    }
}

@end
