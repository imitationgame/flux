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
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"close"] forState:UIControlStateHighlighted];
    [button.imageView setClipsToBounds:YES];
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    self.button = button;
    
    self.model = model;
    self.flowview = model.flow.view;
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(65)]-(-10)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(-10)-[button(65)]" options:0 metrics:metrics views:views]];
    
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
        [self.imageView setAlpha:0.3];
        [self.button setHidden:NO];
    }
    else
    {
        [self.layer setBorderColor:[UIColor clearColor].CGColor];
        [self.imageView setAlpha:1];
        [self.button setHidden:YES];
    }
}

@end