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

-(void)unselectall
{
    NSUInteger count = [self count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mflowpointsitem *item = [self item:i];
        [item.view setSelected:NO];
    }
}

@end