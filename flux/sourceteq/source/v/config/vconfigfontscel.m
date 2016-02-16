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
    self.selector = selector;
    
    [self addSubview:label];
    [self addSubview:selector];
    
    NSDictionary *views = @{};
    NSDictionary *metrics = @{};
    
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
    }
    else
    {
        [self.selector setHidden:YES];
    }
}

#pragma mark public

-(void)config:(id<mconfigfontsprotocol>)model
{
    
}

@end