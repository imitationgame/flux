#import "mflowlinesitem.h"

@implementation mflowlinesitem

-(instancetype)init:(mflowlinesitemlist*)list starting:(CGPoint)starting ending:(CGPoint)ending showinit:(BOOL)showinit
{
    self = [super init];
    
    CGFloat padding = 20;
    self.linewidth = 4;
    self.starting = starting;
    self.ending = ending;
    self.list = list;
    self.showinit = showinit;
    
    NSUInteger startingx = starting.x;
    NSUInteger startingy = starting.y;
    NSUInteger endingx = ending.x;
    NSUInteger endingy = ending.y;
    NSUInteger startingrectx = startingx;
    NSUInteger startingrecty = startingy;
    NSUInteger endingrectx = endingx;
    NSUInteger endingrecty = endingy;
    NSUInteger midx = (fabs((CGFloat)endingx - (CGFloat)startingx) * 0.3);
    NSUInteger midy = (fabs((CGFloat)endingy - (CGFloat)startingy) * 0.3);
    NSUInteger instartx;
    NSUInteger instarty;
    NSUInteger inendx;
    NSUInteger inendy;
    NSUInteger width;
    NSUInteger height;
    NSUInteger inmidx;
    NSUInteger inmidy;
    
    if(startingx > endingx)
    {
        startingrectx = endingx;
        endingrectx = startingx;
        midx = startingx - midx;
    }
    else
    {
        midx += startingx;
    }
    
    if(startingy > endingy)
    {
        startingrecty = endingy;
        endingrecty = startingy;
        midy = startingy - midy;
    }
    else
    {
        midy += startingy;
    }
    
    startingrectx -= padding;
    startingrecty -= padding;
    endingrectx += padding;
    endingrecty += padding;
    width = endingrectx - startingrectx;
    height = endingrecty - startingrecty;
    instartx = startingx - startingrectx;
    instarty = startingy - startingrecty;
    inendx = endingx - startingrectx;
    inendy = endingy - startingrecty;
    inmidx = midx - startingrectx;
    inmidy = midy - startingrecty;
    
    self.instarting = CGPointMake(instartx, instarty);
    self.inending = CGPointMake(inendx, inendy);
    self.midpoint = CGPointMake(inmidx, inmidy);
    self.rect = CGRectMake(startingrectx, startingrecty, width, height);
    
    return self;
}

#pragma mark public

-(vflowline*)generateview
{
    [self.view removeFromSuperview];
    vflowline *view = [[vflowline alloc] init:self];
    self.view = view;
    
    return view;
}

-(void)connecttopoint:(CGPoint)point
{
    [self.list connectline:self topoint:point];
}

-(void)remove
{
    [self.pointitem remove];
    [self.view removeFromSuperview];
    [self.endingett remove];
    [self.nextline remove];
}

@end