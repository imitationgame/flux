#import "sflowlines.h"

@implementation sflowlines

+(void)linesleft
{
    
}

+(void)linesright
{
    
}

+(void)linesrandom
{
    
}

-(instancetype)init
{
    self = [super init];
    
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

@end