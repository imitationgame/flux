#import "mflowettlist.h"

@implementation mflowettlist
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

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mflowett*)item:(NSUInteger)index
{
    mflowett *item = array[index];
    
    return item;
}

@end