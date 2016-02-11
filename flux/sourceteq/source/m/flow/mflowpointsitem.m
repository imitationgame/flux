#import "mflowpointsitem.h"

@implementation mflowpointsitem

+(void)pointat:(NSUInteger)x y:(NSUInteger)y flow:(vflow*)flow
{
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:x y:y];
    vflowpoint *viewpoint = [modelpoint generateview];
    [viewpoint addTarget:flow action:@selector(actionpoint:) forControlEvents:UIControlEventTouchUpInside];
    
    [flow.model.points add:modelpoint];
    [flow.contentview addview:viewpoint];
}

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