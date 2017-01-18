#import <Foundation/Foundation.h>

static void bridge1(void) {
    @autoreleasepool {
        CFAbsoluteTime tm = CFAbsoluteTimeGetCurrent();
        CFDateRef cfdate = CFDateCreate(NULL, tm);
        NSDate *d = (__bridge NSDate *)cfdate;
        CFRelease(cfdate); /* Needed */
        printf("%s\n", [[d description] UTF8String]);

        CFDateRef e;
        NSDate *nsdate = [[NSDate alloc] init];
        e = (__bridge CFDateRef)nsdate;

        tm = CFDateGetAbsoluteTime(e);
        CFGregorianDate g = CFAbsoluteTimeGetGregorianDate ( tm, NULL );
        printf("%04d/%02d/%02d\n", g.year, g.month, g.day);
        /** CFRelease(e); Never **/
    }
}

static void bridge2(void) {
    @autoreleasepool {
        CFAbsoluteTime tm = CFAbsoluteTimeGetCurrent();
        CFDateRef cfdate = CFDateCreate(NULL, tm);
        NSDate *d = (__bridge_transfer NSDate *)cfdate;
        /** CFRelease(cfdate); Never **/
        printf("%s\n", [[d description] UTF8String]);

        CFDateRef e;
        NSDate *nsdate = [[NSDate alloc] init];
        e = (__bridge_retained CFDateRef)nsdate;

        tm = CFDateGetAbsoluteTime(e);
        CFGregorianDate g = CFAbsoluteTimeGetGregorianDate ( tm, NULL );
        printf("%04d/%02d/%02d\n", g.year, g.month, g.day);
        CFRelease(e); /* Needed */
    }
}

int main(void) {
    bridge1();
    bridge2();
    return 0;
}
