#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    [self setFrame:model.rect];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextMoveToPoint(context, self.model.instarting.x, self.model.instarting.y);
    CGContextAddLineToPoint(context, self.model.inending.x, self.model.inending.y);
    CGContextDrawPath(context, kCGPathStroke);
}

@end