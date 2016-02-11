#import "mflow.h"

@implementation mflow
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    
    array = [NSMutableArray array];
    self.width = 0;
    self.height = 0;
    self.points = [[mflowpoints alloc] init];
    self.lines = [[mflowlines alloc] init];
    
    return self;
}

#pragma mark functionality

-(BOOL)rect:(CGRect)rect insersectsview:(UIView*)view
{
    BOOL intersects = NO;
    
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
    
    BOOL valid = NO;
    
    do
    {
        endingpoint = CGPointMake(point.x, point.y + self.deltaline);
    }
    while(!valid);
    
    return endingpoint;
}

-(CGPoint)pointlineleft:(CGPoint)point
{
    CGPoint endingpoint;
    
    BOOL valid = NO;
    
    do
    {
        endingpoint = CGPointMake(point.x - self.deltaline, point.y);
    }
    while(!valid);
    
    return endingpoint;
}

-(CGPoint)pointlineright:(CGPoint)point
{
    CGPoint endingpoint;
    
    BOOL valid = NO;
    
    do
    {
        endingpoint = CGPointMake(point.x + self.deltaline, point.y);
    }
    while(!valid);
    
    return endingpoint;
}

@end