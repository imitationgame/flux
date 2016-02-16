#import "mflowdetail.h"

@implementation mflowdetail
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mflowdetailsave alloc] init],
             [[mflowdetailexport alloc] init],
             nil];
    
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