#import "mflowpointsitem.h"

@implementation mflowpointsitem

-(instancetype)init:(mflowpoints*)points x:(NSUInteger)x y:(NSUInteger)y
{
    self = [super init];

    self.points = points;
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

-(void)remove
{
    [self.points remove:self];
    [self.view removeFromSuperview];
}

@end