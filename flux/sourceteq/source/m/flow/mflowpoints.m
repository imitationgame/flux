#import "mflowpoints.h"

@implementation mflowpoints
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mflowpointsitem*)item:(NSUInteger)index
{
    mflowpointsitem *item = array[index];
    
    return item;
}

-(void)add:(mflowpointsitem*)item
{
    [array addObject:item];
}

-(void)remove:(mflowpointsitem*)item
{
    [item.view removeFromSuperview];
    [array removeObject:item];
}

-(void)selectpoint:(mflowpointsitem*)point
{
    [self.selected.view setSelected:NO];
    self.selected = point;
    [point.view setSelected:YES];
}

-(void)pointat:(NSUInteger)x y:(NSUInteger)y flow:(vflow*)flow
{
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:x y:y];
    vflowpoint *viewpoint = [modelpoint generateview];
    [viewpoint addTarget:flow action:@selector(actionpoint:) forControlEvents:UIControlEventTouchUpInside];
    
    [flow.model.points add:modelpoint];
    [flow.contentview addview:viewpoint];
}

@end