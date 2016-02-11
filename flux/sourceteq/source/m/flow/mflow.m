#import "mflow.h"

@implementation mflow

-(instancetype)init:(vflow*)view
{
    self = [super init];
    
    self.view = view;
    self.width = 0;
    self.height = 0;
    self.ettlist = [[mflowettlist alloc] init:self];
    self.points = [[mflowpoints alloc] init:self];
    self.lines = [[mflowlines alloc] init:self];
    
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

-(void)add:(id<mflowetttypesprotocol>)type
{
    mflowpointsitem *point = self.points.selected;
    [self.ettlist add:type point:point];

    [self.model.points remove:point];
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