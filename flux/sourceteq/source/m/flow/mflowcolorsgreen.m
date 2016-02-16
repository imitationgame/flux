#import "mflowcolorsgreen.h"

@implementation mflowcolorsgreen

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor colorWithRed:0.7 green:0.9 blue:0.3 alpha:1];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_green", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_green;
    
    return type;
}

@end