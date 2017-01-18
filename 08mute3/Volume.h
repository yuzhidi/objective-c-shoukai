/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import <Foundation/NSObject.h>

@interface Volume : NSObject
{
#if defined(FRAGILE)
    int min, max, step;
    long unused;
    int val;
#else
    int val;
    int min, max, step;
#endif
}

- (id)initWithMin:(int)a max:(int)b step:(int)s;
- (int)value;
- (id)up;
- (id)down;
@end
