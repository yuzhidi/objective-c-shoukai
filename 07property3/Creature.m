/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Creature.h"

@implementation Creature
{
    NSString *name;
    int      hitPoint;
    int      magicPoint;
}

- (id)initWithName:(NSString *)str
{
    if ((self = [super init]) != nil) {
        name = str;
        hitPoint = magicPoint = 10;
    }
    return self;
}

@synthesize name;
@synthesize hitPoint, magicPoint;

@dynamic level;

- (int)level {
    return (hitPoint + magicPoint) / 10;
}

@end
