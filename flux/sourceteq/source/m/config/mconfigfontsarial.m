#import "mconfigfontsarial.h"

@implementation mconfigfontsarial

#pragma mark public

-(NSString*)name
{
    NSString *string = NSLocalizedString(@"font_arial", nil);
    
    return string;
}

-(NSString*)fontraw
{
    NSString *fontraw = @"ArialMT";
    
    return fontraw;
}

@end