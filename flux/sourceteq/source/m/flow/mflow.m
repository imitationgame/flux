#import "mflow.h"

@implementation mflow
{
    NSMutableArray *array;
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    
    array = [NSMutableArray array];
    self.flow = flow;
    self.width = 0;
    self.height = 0;
    self.deltaline = 150;
    self.pointmargin = 50;
    self.points = [[mflowpoints alloc] init];
    self.lines = [[mflowlines alloc] init];
    
    return self;
}

#pragma mark functionality

-(BOOL)rect:(CGRect)rect insersectsview:(UIView*)view
{
    BOOL intersects = CGRectIntersectsRect(rect, view.frame);
    
    return intersects;
}

-(BOOL)validatepointat:(CGPoint)point
{
    BOOL valid = YES;
    
    CGRect perrect = CGRectMake(point.x -= self.pointmargin, point.y -= self.pointmargin, point.x += self.pointmargin, point.y += self.pointmargin);
    NSUInteger count = [self count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mflowett *flowett = [self item:i];
        
        if([self rect:perrect insersectsview:flowett.view])
        {
            valid = NO;
            
            break;
        }
    }
    
    if(valid)
    {
        count = [self.points count];
        
        for(NSUInteger i = 0; i < count; i++)
        {
            mflowpointsitem *pointitem = [self.points item:i];
            
            if([self rect:perrect insersectsview:pointitem.view])
            {
                valid = NO;
                
                break;
            }
        }
        
        if(valid)
        {
            count = [self.lines count];
            
            for(NSUInteger i = 0; i < count; i++)
            {
                mflowlinesitem *lineitem = [self.lines item:i];
                
                if([self rect:perrect insersectsview:lineitem.view])
                {
                    valid = NO;
                    
                    break;
                }
            }
        }
    }
    
    return NO;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mflowett*)item:(NSUInteger)index
{
    mflowett *item = array[index];
    
    return item;
}

-(vflowett*)add:(id<mflowetttypesprotocol>)type point:(mflowpointsitem*)point
{
    mflowett *ettmodel = [type modelett];
    [ettmodel atpoint:point];
    vflowett *ettview = [ettmodel generateview];
    
    [array addObject:ettmodel];
    
    return ettview;
}

-(CGPoint)pointlinedown:(CGPoint)point
{
    CGPoint endingpoint;
    NSUInteger y;
    
    BOOL valid = NO;
    
    do
    {
        y += self.deltaline;
        endingpoint = CGPointMake(point.x, y);
    }
    while(!valid);
    
    return endingpoint;
}

-(CGPoint)pointlineleft:(CGPoint)point
{
    CGPoint endingpoint;
    NSUInteger x = point.x;
    
    BOOL valid = NO;
    
    do
    {
        x -= self.deltaline;
        endingpoint = CGPointMake(x, point.y);
    }
    while(!valid);
    
    return endingpoint;
}

-(CGPoint)pointlineright:(CGPoint)point
{
    CGPoint endingpoint;
    NSUInteger x = point.x;
    
    BOOL valid = NO;
    
    do
    {
        x+= self.deltaline;
        endingpoint = CGPointMake(x, point.y);
    }
    while(!valid);
    
    return endingpoint;
}

@end