#import "mconfigfontshelvetica.h"

@implementation mconfigfontshelvetica

#pragma mark public

-(NSString*)name
{
    NSString *string = NSLocalizedString(@"font_helvetica", nil);
    
    return string;
}

-(NSString*)fontraw
{
    NSString *fontraw = @"HelveticaNeue";
    
    return fontraw;
}

@end