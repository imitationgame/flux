#import "vflowpoint.h"

@implementation vflowpoint

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y
{
    self = [super initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self setClipsToBounds:YES];
    [self setCenter:CGPointMake(x, y)];
    [self.layer setCornerRadius:25];
    [self hover];
    
    self.x = x;
    self.y = y;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSUInteger width = rect.size.width;
    NSUInteger height = rect.size.height;
    NSUInteger width_2 = width / 2;
    NSUInteger height_2 = height / 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextMoveToPoint(context, width_2, 8);
    CGContextAddLineToPoint(context, width_2, height - 16);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextMoveToPoint(context, 8, height_2);
    CGContextAddLineToPoint(context, width - 16, height_2);
    CGContextDrawPath(context, kCGPathStroke);
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
        [self setTintColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
        [self setTintColor:[UIColor colorWithWhite:0.7 alpha:1]];
    }
    
    [self setNeedsDisplay];
}

@end