#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super initWithFrame:model.rect];
    [self setClipsToBounds:NO];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    [self setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.model.linewidth);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextMoveToPoint(context, self.model.instarting.x, self.model.instarting.y);
    CGContextAddLineToPoint(context, self.model.inending.x, self.model.inending.y);
    CGContextDrawPath(context, kCGPathStroke);
    
    if(self.model.showinit)
    {
        CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
        CGContextAddArc(context, self.model.midpoint.x, self.model.midpoint.y, 13, 0.001, 0, 0);
        CGContextDrawPath(context, kCGPathFill);
    }
}

@end