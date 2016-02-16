#import "mconfigfontsfutura.h"

@implementation mconfigfontsfutura

#pragma mark public

-(NSString*)name
{
    NSString *string = NSLocalizedString(@"font_futura", nil);
    
    return string;
}

-(NSString*)fontraw
{
    NSString *fontraw = @"Futura-Medium";
    
    return fontraw;
}

@end