/*** Copyright: OGIHARA Takeshi, Jan. 2008 ***/

#import <Foundation/Foundation.h>

@interface Creature : NSObject
{
    NSString *name;
    int      hitPoint;
    int      magicPoint;
}
- (id)initWithName:(NSString *)str;
@property(readonly) NSString *name;
@property int hitPoint;
@property(readonly) int level;

@end
