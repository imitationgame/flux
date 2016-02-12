#import "mflowpoints.h"

@implementation mflowpoints
{
    NSMutableArray *array;
}

-(instancetype)init:(mflow*)flow
{
    self = [super init];
    
    self.flow = flow;
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)processmodel:(mflowpointsitem*)modelpoint
{
    vflowpoint *viewpoint = [modelpoint generateview];
    [viewpoint addTarget:self.flow.view action:@selector(actionpoint:) forControlEvents:UIControlEventTouchUpInside];
    
    [self add:modelpoint];
    [self.flow.view.contentview addSubview:viewpoint];
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

-(void)unselect
{
    [self.selected.view setSelected:NO];
    self.selected = nil;
}

-(void)pointat:(NSUInteger)x y:(NSUInteger)y
{
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:x y:y];
    [self processmodel:modelpoint];
}

-(void)pointatline:(mflowlinesitem*)line
{
    CGPoint endingpoint = line.ending;
    
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:endingpoint.x y:endingpoint.y];
    modelpoint.line = line;
    [self processmodel:modelpoint];
}

@end