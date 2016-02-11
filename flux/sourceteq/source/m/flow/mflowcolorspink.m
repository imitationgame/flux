#import "mflowcolorspink.h"

@implementation mflowcolorspink

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = [UIColor magentaColor];
    
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