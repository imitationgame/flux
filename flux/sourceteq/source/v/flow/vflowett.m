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
    [self.layer setBorderWidth:2];
    [self hover];
    
    self.model = model;
    self.flowview = model.flow.view;
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.layer setBorderColor:[UIColor colorWithWhite:0 alpha:0.8].CGColor];
    }
    else
    {
        [self.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

@end