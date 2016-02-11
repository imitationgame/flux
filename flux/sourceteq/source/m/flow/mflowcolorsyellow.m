#import "mflowcolorsyellow.h"

@implementation mflowcolorsyellow

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor yellowColor];
    
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