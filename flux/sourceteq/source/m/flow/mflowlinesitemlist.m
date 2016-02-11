#import "mflowlinesitemlist.h"

@implementation mflowlinesitemlist
{
    NSMutableArray *array;
}

-(instancetype)init:(mflowett*)flowett
{
    self = [super init];
    
    self.flowett = flowett;
    array = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mflowlinesitem*)item:(NSUInteger)index
{
    mflowlinesitem *item = array[index];
    
    return item;
}

-(void)add:(mflowlinesitem*)item
{
    [array addObject:item];
}

-(void)linedown
{
    CGPoint linestart = CGPointMake(self.flowett.x, self.flowett.y);
    CGPoint lineend = [self.flowett.flow.view.contentview linefrom:linestart deltax:0 deltay:1];
    
    
    mflowlinesitem *linemodel = [[mflowlinesitem alloc] init:starting ending:ending];
    vflowline *lineview = [linemodel generateview];
    
    [flow.model.lines add:linemodel];
    [flow.contentview addSubview:lineview];
    
    
    
    
    mflowlinesitem *line = [self addlinestarting:linestarting ending:lineending];
    line.startingett = ettview.model;
}

@end