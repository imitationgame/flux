#import "mconfigfonts.h"

@implementation mconfigfonts
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray array];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfigfontsprotocol>)item:(NSUInteger)index;
{
    id<mconfigfontsprotocol> item = array[index];
    
    return item;
}

@end