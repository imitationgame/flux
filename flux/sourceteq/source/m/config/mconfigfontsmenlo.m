#import "mconfigfontsmenlo.h"

@implementation mconfigfontsmenlo

#pragma mark public

-(NSString*)name
{
    NSString *string = NSLocalizedString(@"", nil);
    
    return string;
}

-(NSString*)fontraw
{
    NSString *fontraw = fontname;
    
    return fontraw;
}

@end