#import "mlist.h"

@implementation mlist
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    [self reload];
    
    return self;
}

-(void)dealloc
{
    
}

#pragma mark public

-(void)reload
{
    array = [NSMutableArray array];
}

-(NSUInteger)count
{
    
}

-(mlistitem*)item:(NSUInteger)index
{
    
}

@end