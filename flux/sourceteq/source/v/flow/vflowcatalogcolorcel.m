#import "vflowcatalogcolorcel.h"

@implementation vflowcatalogcolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat outermargin = 16;
    CGFloat outerwidth_margin = frame.size.width - (outermargin * 2);
    CGFloat outerwidth_margin_2 = outerwidth_margin / 2.0;
    CGFloat margin = 22;
    CGFloat width_margin = frame.size.width - (margin * 2);
    CGFloat width_margin_2 = width_margin / 2.0;
    
    UIView *outercircle = [[UIView alloc] init];
    [outercircle setUserInteractionEnabled:NO];
    [outercircle setClipsToBounds:YES];
    [outercircle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [outercircle.layer setCornerRadius:outerwidth_margin_2];
    self.outercircle = outercircle;
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setClipsToBounds:YES];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:width_margin_2];
    self.circle = circle;
    
    UIView *selector = [[UIView alloc] init];
    [selector setUserInteractionEnabled:NO];
    [selector setClipsToBounds:YES];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.selector = selector;

    [self addSubview:outercircle];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"outercircle":outercircle, @"circle":circle};
    NSDictionary *metrics = @{@"margin":@(margin), @"outermargin":@(outermargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(outermargin)-[outercircle]-(outermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(outermargin)-[outercircle]-(outermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(outermargin)-[selector]-(outermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:-[selector(2)]-0-|" options:0 metrics:metrics views:views]];
    [self addSubview:selector];
    
    return self;
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.outercircle setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
        [self.selector setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.8]];
    }
    else
    {
        [self.outercircle setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
        [self.selector setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(id<mflowcolorsprotocol>)model
{
    [self.circle setBackgroundColor:[model color]];
    [self hover];
}

@end