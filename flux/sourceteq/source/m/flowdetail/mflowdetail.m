#import "mflowdetail.h"

@implementation mflowdetail
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

-(id<mflowdetailprotocol>)item:(NSUInteger)index
{
    id<mflowdetailprotocol> item = array[index];
    
    return item;
}

@end