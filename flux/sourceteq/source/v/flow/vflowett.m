#import "vflowett.h"
#import "appdel.h"

@implementation vflowett

-(instancetype)init:(mflowett*)model imagename:(NSString*)imagename
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setImage:[[UIImage imageNamed:imagename] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageView setClipsToBounds:YES];
    [self.imageView setTintColor:[model.color color]];
    
    self.model = model;
    self.flowview = model.flow.view;
    
    return self;
}

@end