#import "vflowcatalogettcel.h"

@implementation vflowcatalogettcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:12]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    [self addSubview:label];
    [self addSubview:image];
    
    NSDictionary *views = @{@"label":label, @"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[image(40)]-0-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
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
    UIColor *color;
    
    if(self.isSelected || self.isHighlighted)
    {
        color = colormain;
    }
    else
    {
        color = [UIColor colorWithWhite:0 alpha:0.3];
    }
    
    [self.label setTextColor:color];
    [self.image setTintColor:color];
}

#pragma mark public

-(void)config:(id<mflowetttypesprotocol>)item
{
    [self.label setText:[item labeltext]];
    [self.image setImage:[[UIImage imageNamed:[item imagename]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
    [self hover];
}

@end