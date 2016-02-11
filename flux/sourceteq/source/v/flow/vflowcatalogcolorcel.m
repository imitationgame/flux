#import "vflowcatalogcolorcel.h"

@implementation vflowcatalogcolorcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    CGFloat margin = 15;
    CGFloat width_margin = frame.size.width - (margin * 2);
    CGFloat width_margin_2 = width_margin / 2.0;
    
    UIView *circle = [[UIView alloc] init];
    [circle setUserInteractionEnabled:NO];
    [circle setClipsToBounds:YES];
    [circle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [circle.layer setCornerRadius:width_margin_2];
    self.circle = circle;
    
    [self addSubview:circle];
    
    NSDictionary *views = @{@"circle":circle};
    NSDictionary *metrics = @{@"margin":@(margin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[circle]-(margin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end