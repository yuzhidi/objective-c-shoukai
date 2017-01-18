/*** Copyright: OGIHARA Takeshi, Feb. 2008 ***/

#import <Foundation/Foundation.h>
#import <objc/objc.h>
#import <objc/runtime.h>
#import <stdio.h>

@interface NSObject (Metaclass)
+ (Class)metaclass;
+ (Class)super_class;
@end

@implementation NSObject (Metaclass)
+ (Class)metaclass {
    return (Class)(struct objc_object *)self->isa;
}
+ (Class)super_class {
    return [(struct objc_object *)self superclass];
}
@end

@interface A : NSObject
- (id)testMethod;
@end

@implementation A
- (id)testMethod { return isa; }
@end

@interface B : A
+ (id)testMethod;
@end

@implementation B
+ (id)testMethod { return self; }
@end

void printmeta(Class cls, int n, int depth)
{
    Class newc;
    if (n <= 0 || cls == Nil) return;
    newc = [cls metaclass];
    printf("%*smetaclass = %08x\n", depth*4, "", (unsigned)newc);
    printmeta(newc, n-1, depth+1);
    newc = [cls super_class];
    printf("%*ssuperclass= %08x\n", depth*4, "", (unsigned)newc);
    printmeta(newc, n-1, depth+1);
}

int main(void)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    id a = [[A alloc] init];
    id b = [[B alloc] init];
    printf("a = %08x\n", (unsigned)a);
    printf("b = %08x\n", (unsigned)b);
    printf("[a class] = %08x\n", (unsigned)[a class]);
    printmeta([a class], 3, 0);
    printf("[b class] = %08x\n", (unsigned)[b class]);
    printmeta([b class], 4, 0);
    [pool release];
    return 0;
}
