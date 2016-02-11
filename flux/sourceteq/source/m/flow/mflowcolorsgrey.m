#import "mflowcolorsgrey.h"

@implementation mflowcolorsgrey

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor grayColor];
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"flow_colors_grey", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_grey;
    
    return type;
}

@end