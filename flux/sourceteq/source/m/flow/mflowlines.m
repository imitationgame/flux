#import "mflowlines.h"

@implementation mflowlines
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
    return array.count;
}

-(mflowlinesitem*)item:(NSUInteger)index
{
    mflowlinesitem *item = array[index];
    
    return item;
}

@end