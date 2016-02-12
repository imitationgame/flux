#import "sflowlines.h"

@implementation sflowlines

+(instancetype)linesleft
{
    sflowlines *lines = [[sflowlines alloc] init];
    lines.array = [NSArray arrayWithObjects:
                   [[sflowlinesright alloc] init],
                   [[sflowlinesleft alloc] init],
                   nil];
    
    return lines;
}

+(instancetype)linesright
{
    sflowlines *lines = [[sflowlines alloc] init];
    lines.array = [NSArray arrayWithObjects:
                   [[sflowlinesright alloc] init],
                   [[sflowlinesleft alloc] init],
                   nil];
    
    return lines;
}

+(instancetype)linesrandom
{
    sflowlines *lines;
    
    NSInteger rand = arc4random_uniform(2);
    
    if(rand)
    {
        lines = [sflowlines linesleft];
    }
    else
    {
        lines = [sflowlines linesright];
    }
    
    return lines;
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