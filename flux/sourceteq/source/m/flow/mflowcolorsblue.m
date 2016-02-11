#import "mflowcolorsblue.h"

@implementation mflowcolorsblue

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor blueColor];
    
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