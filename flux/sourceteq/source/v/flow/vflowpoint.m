#import "vflowpoint.h"

@implementation vflowpoint

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y
{
    self = [super initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self setClipsToBounds:YES];
    [self setCenter:CGPointMake(x, y)];
    [self.layer setCornerRadius:6];
    
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
        [self setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
    }
    else
    {
        [self setBackgroundColor:[UIColor colorWithWhite:0.7 alpha:1]];
    }
}

@end