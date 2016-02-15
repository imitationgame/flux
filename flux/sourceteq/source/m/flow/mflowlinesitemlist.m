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

-(mflowlinesitem*)addlinestart:(CGPoint)linestart lineend:(CGPoint)lineend point:(BOOL)point showinit:(BOOL)showinit
{
    mflowlinesitem *linemodel = [[mflowlinesitem alloc] init:self starting:linestart ending:lineend showinit:showinit];
    vflowline *lineview = [linemodel generateview];
    linemodel.startingett = self.flowett;
    [self add:linemodel];
    [self.flowett.flow.view.contentview.container insertSubview:lineview atIndex:0];

    if(point)
    {
        [self.flowett.flow.points pointatline:linemodel];
    }
    
    return linemodel;
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
    
    [self addlinestart:linestart lineend:lineend point:YES showinit:YES];
}

-(void)linesparting
{
    vflowcontent *content = self.flowett.flow.view.contentview;
    CGPoint linestart = CGPointMake(self.flowett.x, self.flowett.y);
    CGPoint lineendright = [content linefrom:linestart deltax:1 deltay:0];
    CGPoint lineendleft = [content linefrom:linestart deltax:-1 deltay:0];
    
    mflowlinesitem *lineright = [self addlinestart:linestart lineend:lineendright point:NO showinit:YES];
    mflowlinesitem *lineleft = [self addlinestart:linestart lineend:lineendleft point:NO showinit:YES];
    
    CGPoint lineendrightdown = [content linefrom:lineendright deltax:0 deltay:1];
    CGPoint lineendleftdown = [content linefrom:lineendleft deltax:0 deltay:1];
    
    mflowlinesitem *linerightdown = [self addlinestart:lineendright lineend:lineendrightdown point:YES showinit:NO];
    mflowlinesitem *lineleftdown = [self addlinestart:lineendleft lineend:lineendleftdown point:YES showinit:NO];
    
    lineright.nextline = linerightdown;
    linerightdown.prevline = lineright;
    
    lineleft.nextline = lineleftdown;
    lineleftdown.prevline = lineleft;
}

-(void)connectline:(mflowlinesitem*)line topoint:(CGPoint)point
{
    NSUInteger startpointx = line.ending.x;
    NSUInteger startpointy = line.ending.y;
    NSUInteger endpointx = point.x;
    NSUInteger endpointy = point.y;
    sflowlines *strategy = [[sflowlines alloc] init];
    
    if(startpointx > endpointx)
    {
        [strategy linesright];
    }
    else if(startpointx < endpointx)
    {
        [strategy linesleft];
    }
    else
    {
        [strategy linesrandomleftright];
    }
    
    if(startpointy > endpointy)
    {
        CGFloat sum = 0;
        
        while(startpointy - sum > endpointy)
        {
            [strategy linesup];
            
            sum += deltaline;
        }
    }
    else if(startpointy < endpointy)
    {
        CGFloat sum = 0;
        
        while(startpointy + sum < endpointy)
        {
            [strategy linesdown];
            
            sum += deltaline;
        }
    }
    else
    {
        [strategy linesrandomupdown];
    }
    
    vflowcontent *content = self.flowett.flow.view.contentview;
    mflowlinesitem *currentline = line;
    NSUInteger count = strategy.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        id<sflowlinesprotocol> stritem = [strategy item:i];
        
        CGPoint nextpoint = [content linefrom:currentline.ending deltax:[stritem deltax] deltay:[stritem deltay]];
        mflowlinesitem *newline = [self addlinestart:currentline.ending lineend:nextpoint point:NO showinit:NO];
        currentline.nextline = newline;
        newline.prevline = currentline;
        currentline = newline;
    }
    
    mflowlinesitem *endingline = [self addlinestart:currentline.ending lineend:point point:NO showinit:NO];
    currentline.nextline = endingline;
}

-(void)remove
{
    NSUInteger count = [self count];
    
    for(NSInteger i = count - 1; i >= 0; i--)
    {
        mflowlinesitem *line = [self item:i];
        [line remove];
    }
}

@end