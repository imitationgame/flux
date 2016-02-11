#import "mflowcolors.h"

@implementation mflowcolors
{
    NSArray *array;
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

-(id<mflowcolorsprotocol>)item:(NSUInteger)index
{
    id<mflowcolorsprotocol> item = array[index];
    
    return item;
}

@end