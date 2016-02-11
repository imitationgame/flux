#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super initWithFrame:model.rect];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.model.linewidth);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.8 alpha:1].CGColor);
    CGContextMoveToPoint(context, self.model.instarting.x, self.model.instarting.y);
    CGContextAddLineToPoint(context, self.model.inending.x, self.model.inending.y);
    CGContextDrawPath(context, kCGPathStroke);
}

@end