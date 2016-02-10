#import "vflowcatalogettcel.h"

@implementation vflowcatalogettcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.8]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:12]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label = label;
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-5-|" options:0 metrics:metrics views:views]];
    
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
        color = [UIColor blackColor];
    }
    else
    {
        color = [UIColor colorWithWhite:0 alpha:0.3];
    }
    
    [self.label setTextColor:color];
    [self.overview setBackgroundColor:color];
}

#pragma mark public

-(void)config:(id<mflowetttypesprotocol>)item
{
    [self.overview removeFromSuperview];
    self.overview = [item overview];
    [self.label setText:[item labeltext]];
    [self addSubview:self.overview];
    
    [self hover];
}

@end