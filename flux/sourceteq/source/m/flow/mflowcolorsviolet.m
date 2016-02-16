#import "mflowcolorsviolet.h"

@implementation mflowcolorsviolet

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor colorWithRed:0.7 green:0.3 blue:0.9 alpha:1];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_violet", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_violet;
    
    return type;
}

@end