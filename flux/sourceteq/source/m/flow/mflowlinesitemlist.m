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

-(void)addlinestart:(CGPoint)linestart lineend:(CGPoint)lineend
{
    mflowlinesitem *linemodel = [[mflowlinesitem alloc] init:linestart ending:lineend];
    vflowline *lineview = [linemodel generateview];
    linemodel.startingett = self.flowett;
    [self add:linemodel];
    [self.flowett.flow.view.contentview addSubview:lineview];
    [self.flowett.flow.view addpointatx:lineend.x y:lineend.y];
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
    
    [self addlinestart:linestart lineend:lineend];
}

-(void)linesparting
{
    CGPoint linestart = CGPointMake(self.flowett.x, self.flowett.y);
    CGPoint lineendright = [self.flowett.flow.view.contentview linefrom:linestart deltax:1 deltay:0];
    CGPoint lineendleft = [self.flowett.flow.view.contentview linefrom:linestart deltax:-1 deltay:0];
    
    [self addlinestart:linestart lineend:lineendright];
    [self addlinestart:linestart lineend:lineendleft];
}

@end