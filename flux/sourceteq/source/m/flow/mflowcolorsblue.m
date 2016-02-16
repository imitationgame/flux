#import "mflowcolorsblue.h"

@implementation mflowcolorsblue

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor colorWithRed:0.4 green:0.7 blue:0.9 alpha:1];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_blue", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_blue;
    
    return type;
}

@end