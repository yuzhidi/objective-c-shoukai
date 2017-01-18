/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/Foundation.h>
#import "Philosopher.h"

#define PHILOSOPHERS  5

int main(void)
{
    NSLock *forks[PHILOSOPHERS];
    Philosopher *phils[PHILOSOPHERS];
    int i, j;

    for (i = 0; i < PHILOSOPHERS; i++)
        forks[i] = [[NSLock alloc] init];
    for (i = 0, j = PHILOSOPHERS-1; i < PHILOSOPHERS; j = i++) {
        phils[i] = [[Philosopher alloc]
                initWithLeft:forks[j] right:forks[i]];
        phils[i].tag = i;
    }
    @autoreleasepool {
        for (i = 0; i < PHILOSOPHERS; i++)
            [NSThread detachNewThreadSelector:@selector(start:)
                toTarget:phils[i] withObject:nil];
        (void)getchar(); // wait here
    }
    for (i = 0; i < PHILOSOPHERS; i++)
        printf("Philosopher #%d: %s\n", i+1, phils[i].state);
    return 0;
}
