#import "mflowcolorsgreen.h"

@implementation mflowcolorsgreen

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor greenColor];
    
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