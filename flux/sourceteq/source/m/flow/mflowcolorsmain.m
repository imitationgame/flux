#import "mflowcolorsmain.h"

@implementation mflowcolorsmain

#pragma mark colors protocol

-(UIColor*)color
{
    UIColor *color = colormain;
    
    return color;
}

-(NSString*)name
{
    NSString *name = NSLocalizedString(@"", nil);
    
    return name;
}

-(colortype)type
{
    colortype type = colortype_main;
    
    return type;
}

@end