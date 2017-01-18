/*** Copyright: OGIHARA Takeshi, March 2008 ***/

#import "Creature2.h"

@implementation Creature

- (id)initWithName:(NSString *)str
{
    if ((self = [super init]) != nil) {
        name = str;
        hitPoint = magicPoint = 10;
    }
    return self;
}

- (NSString *)name {
    return name;
}
- (int)hitPoint {
    return hitPoint;
}
- (void)setHitPoint:(int)val {
    hitPoint = val;
}
- (int)level {
    return (hitPoint + magicPoint) / 10;
}

@end
