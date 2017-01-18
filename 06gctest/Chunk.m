/*** Copyright: OGIHARA Takeshi, Aug. 2010 ***/

#import "Chunk.h"
#import <stdio.h>
#import <libc.h>

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
