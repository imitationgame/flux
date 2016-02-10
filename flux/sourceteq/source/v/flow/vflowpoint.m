#import "vflowpoint.h"

@implementation vflowpoint

-(instancetype)init:(mflowpointsitem*)flowpoint
{
    self = [super initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self setClipsToBounds:YES];
    [self setCenter:CGPointMake(flowpoint.x, flowpoint.y)];
    [self.layer setCornerRadius:25];
    [self hover];
    
    self.model = flowpoint;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSUInteger width = rect.size.width;
    NSUInteger height = rect.size.height;
    NSUInteger width_2 = width / 2;
    NSUInteger height_2 = height / 2;
    NSUInteger margin = 15;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextMoveToPoint(context, width_2, margin);
    CGContextAddLineToPoint(context, width_2, height - margin);
    CGContextDrawPath(context, kCGPathStroke);
    CGContextMoveToPoint(context, margin, height_2);
    CGContextAddLineToPoint(context, width - margin, height_2);
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
        [self setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
        [self setTintColor:[UIColor colorWithWhite:0.7 alpha:1]];
    }
    
    [self setNeedsDisplay];
}

@end