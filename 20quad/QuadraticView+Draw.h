/*** Copyright: OGIHARA Takeshi, Feb. 2008 ***/

#import "QuadraticView.h"

@class NSBezierPath;

@interface QuadraticView (Draw)

- (NSBezierPath *)pathCurve;
- (void)redrawGraph;

@end

