#import "sflowlines.h"

@implementation sflowlines

-(instancetype)init
{
    self = [super init];
 
    self.array = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = self.array.count;
    
    return count;
}

-(id<sflowlinesprotocol>)item:(NSUInteger)index
{
    id<sflowlinesprotocol> item = self.array[index];
    
    return item;
}

-(void)linesleft
{
    [self.array addObject:[[sflowlinesleft alloc] init]];
}

-(void)linesright
{
    [self.array addObject:[[sflowlinesright alloc] init]];
}

-(void)linesrandomleftright
{
    NSInteger rand = arc4random_uniform(2);
    
    if(rand)
    {
        [self linesleft];
    }
    else
    {
        [self linesright];
    }
}

@end