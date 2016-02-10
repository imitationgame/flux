#import "mflowlinesitem.h"

@implementation mflowlinesitem

-(instancetype)init:(CGPoint)starting ending:(CGPoint)ending
{
    self = [super init];
    
    self.starting = starting;
    self.ending = ending;
    
    NSUInteger startingx = starting.x;
    NSUInteger startingy = starting.y;
    NSUInteger endingx = ending.x;
    NSUInteger endingy = ending.y;
    NSUInteger startingrectx = startingx;
    NSUInteger startingrecty = startingy;
    NSUInteger endingrectx = endingx;
    NSUInteger endingrecty = endingy;
    NSUInteger instartx;
    NSUInteger instarty;
    NSUInteger inendx;
    NSUInteger inendy;
    NSUInteger width;
    NSUInteger height;
    
    if(startingx > endingx)
    {
        startingrectx = endingx;
        endingrectx = startingx;
    }
    
    if(startingy > endingy)
    {
        startingrecty = endingy;
        endingrecty = startingy;
    }
    
    width = endingrectx - startingrectx;
    height = endingrecty - startingrecty;
    instartx = startingx - startingrectx;
    instarty = startingy - startingrecty;
    inendx = endingx - startingrectx;
    inendy = endingy - startingrecty;
    
    self.instarting = CGPointMake(instartx, instarty);
    self.inending = CGPointMake(inendx, inendy);
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

@end