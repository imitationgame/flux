#import "mflowlinesitem.h"

@implementation mflowlinesitem

-(instancetype)init:(CGPoint)starting ending:(CGPoint)ending
{
    self = [super init];
    
    self.starting = starting;
    self.ending = ending;
    
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