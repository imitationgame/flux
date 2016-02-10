#import "mflowetttypes.h"

@implementation mflowetttypes
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mflowetttypescon alloc] init],
             [[mflowetttypespro alloc] init],
             nil];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mflowetttypesprotocol>)item:(NSUInteger)index
{
    id<mflowetttypesprotocol> item = array[index];
    
    return item;
}

@end