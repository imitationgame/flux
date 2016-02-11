#import "vflowcatalogcolorcel.h"

@implementation vflowcatalogcolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat outermargin = 17;
    CGFloat outerwidth_margin = frame.size.width - (outermargin * 2);
    CGFloat outerwidth_margin_2 = outerwidth_margin / 2.0;
    CGFloat margin = 20;
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

    [self addSubview:outercircle];
    [self addSubview:circle];
    
    NSDictionary *views = @{@"outercircle":outercircle, @"circle":circle};
    NSDictionary *metrics = @{@"margin":@(margin), @"outermargin":@(outermargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(outermargin)-[outercircle]-(outermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(outermargin)-[outercircle]-(outermargin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.circle setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    }
    else
    {
        [self.circle setBackgroundColor:[UIColor clearColor]];
    }
}

#pragma mark public

-(void)config:(id<mflowcolorsprotocol>)model
{
    [self.circle setBackgroundColor:[model color]];
    [self hover];
}

@end