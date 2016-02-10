#import "mflowpointsitem.h"

@implementation mflowpointsitem

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y
{
    self = [super init];

    self.x = x;
    self.y = y;
    
    return self;
}

#pragma mark public

-(vflowpoint*)generateview
{
    [self.view removeFromSuperview];
    vflowpoint *view = [[vflowpoint alloc] init:self];
    self.view = view;
    
    return view;
}

@end