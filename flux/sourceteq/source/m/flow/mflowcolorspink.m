#import "mflowcolorspink.h"

@implementation mflowcolorspink

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor colorWithRed:0.9 green:0.3 blue:0.9 alpha:1];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_pink", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_pink;
    
    return type;
}

@end