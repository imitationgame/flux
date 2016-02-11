#import "mflowcolorsviolet.h"

@implementation mflowcolorsviolet

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor purpleColor];
    
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