#import "mconfigfonts.h"

@implementation mconfigfonts
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mconfigfontsmenlo alloc] init],
             [[mconfigfontsarial alloc] init],
             [[mconfigfontshelvetica alloc] init],
             [[mconfigfontstimes alloc] init],
             [[mconfigfontsfutura alloc] init],
             nil];
    
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