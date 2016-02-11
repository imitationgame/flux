#import "mflowlinesitemlist.h"

@implementation mflowlinesitemlist
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mflowlinesitem*)item:(NSUInteger)index
{
    mflowlinesitem *item = array[index];
    
    return item;
}

-(void)add:(mflowlinesitem*)item
{
    [array addObject:item];
}

@end