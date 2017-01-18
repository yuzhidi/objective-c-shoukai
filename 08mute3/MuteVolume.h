/*** Copyright: OGIHARA Takeshi, March 2006 ***/

#import "Volume.h"

@interface MuteVolume : Volume
{
    BOOL   muting;
}

/* override */
- (id)initWithMin:(int)a max:(int)b step:(int)s;
- (int)value;

- (id)mute;
@end
