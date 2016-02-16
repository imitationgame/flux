#import "mflowcolorsyellow.h"

@implementation mflowcolorsyellow

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor colorWithRed:0.95 green:0.92 blue:0 alpha:1];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_yellow", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_yellow;
    
    return type;
}

@end