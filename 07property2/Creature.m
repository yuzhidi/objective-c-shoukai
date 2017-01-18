/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import "Creature.h"

@implementation Creature

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
