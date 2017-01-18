/*** Copyright: OGIHARA Takeshi, Sept. 2011 ***/

#import "Figure.h"
#import <Foundation/NSString.h>

@implementation Figure

@synthesize location;
- (void)setSize:(NSSize)newsize { /* virtual */ }
- (double)area { return 0.0; }  /* virtual */
- (NSString *)figureName { return nil; } /* virtual */
- (NSString *)stringOfSize { return nil; } /* virtual */

- (NSString *)description
{
    NSPoint loc = self.location;
    return [NSString stringWithFormat:
        @"%@: location=(%.2f, %.2f), %@, area=%.2f",
        [self figureName], loc.x, loc.y,
        [self stringOfSize], [self area]];
}

@end

