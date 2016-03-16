#import "vconfigfontscel.h"

@implementation vconfigfontscel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    self.label = label;
    
    UIView *selector = [[UIView alloc] init];
    [selector setBackgroundColor:colormain];
    [selector setUserInteractionEnabled:NO];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector.layer setCornerRadius:4];
    self.selector = selector;
    
    [self addSubview:selector];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-2-[selector]-2-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[selector]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
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
        [self.selector setHidden:NO];
        [self.label setTextColor:[UIColor whiteColor]];
    }
    else
    {
        [self.selector setHidden:YES];
        [self.label setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    }
}

#pragma mark public

-(void)config:(id<mconfigfontsprotocol>)model
{
    [self.label setText:[model name]];
    [self.label setFont:[UIFont fontWithName:[model fontraw] size:15]];
    [self hover];
}

@end