/*** Copyright: OGIHARA Takeshi, Feb. 2008 ***/

#import "MuteVolume.h"

@implementation MuteVolume

/* override */
- (id)initWithMin:(int)a max:(int)b step:(int)s
{
    self = [super initWithMin:a max:b step:s];
    if (self != nil)
        muting = NO;
    return self;
}

/* override */
- (int)value
{
    return muting ? min : val;
}

- (id)mute
{
    muting = !muting;
    return self;
}

@end
