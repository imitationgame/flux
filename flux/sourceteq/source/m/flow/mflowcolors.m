#import "mflowcolors.h"

@implementation mflowcolors
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mflowcolorsmain alloc] init],
             [[mflowcolorsblue alloc] init],
             [[mflowcolorsgreen alloc] init],
             [[mflowcolorsyellow alloc] init],
             [[mflowcolorsviolet alloc] init],
             [[mflowcolorsgrey alloc] init],
             [[mflowcolorspink alloc] init],
             nil];
    
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