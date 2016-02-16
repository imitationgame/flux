#import "mconfigfontstimes.h"

@implementation mconfigfontstimes

#pragma mark public

-(NSString*)name
{
    NSString *string = NSLocalizedString(@"font_times", nil);
    
    return string;
}

-(NSString*)fontraw
{
    NSString *fontraw = @"TimesNewRomanPSMT";
    
    return fontraw;
}

@end