/*** Copyright: OGIHARA Takeshi, Oct. 2011 ***/

#import <Foundation/NSObject.h>

@interface TwoWayList : NSObject <NSCopying, NSCoding>
{
    int      value;
    __weak   TwoWayList *prev;  // not retained
    __strong TwoWayList *next;
}

- (id)initWithIntValue:(int)val;
- (void)addNewValue:(int)val;
- (id)next;
- (int)intValue;

@end
