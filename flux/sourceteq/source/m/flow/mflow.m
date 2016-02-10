#import "mflow.h"

@implementation mflow
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    self.points = [[mflowpoints alloc] init];
    
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