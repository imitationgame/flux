#import "mflowlines.h"

@implementation mflowlines
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

#pragma mark public

-(void)add:(mflowlinesitem*)item
{
    [array addObject:item];
}

-(NSUInteger)count
{
    return array.count;
}

-(mflowlinesitem*)item:(NSUInteger)index
{
    mflowlinesitem *item = array[index];
    
    return item;
}

@end