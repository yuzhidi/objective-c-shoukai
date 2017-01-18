/*** Copyright: OGIHARA Takeshi, Jan. 2008 ***/

#import <Foundation/Foundation.h>

@interface Creature : NSObject
{
    NSString *name;
    int      hitPoint;
    int      magicPoint;
}
- (id)initWithName:(NSString *)str;
- (NSString *)name;
- (int)hitPoint;
- (void)setHitPoint:(int)val;
- (int)level;
@end
