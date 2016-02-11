#import "mflowettlist.h"

@implementation mflowettlist
{
    NSMutableArray *array;
}

-(instancetype)init:(mflow*)flow
{
    self = [super init];
    
    self.flow = flow;
    array = [NSMutableArray array];
    
    return self;
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

-(void)add:(id<mflowetttypesprotocol>)type point:(mflowpointsitem*)point
{
    mflowett *ettmodel = [type modelett:self.flow];
    [ettmodel atpoint:point];
    vflowett *ettview = [ettmodel generateview];
    
    
    
    CGPoint linestarting = CGPointMake(ettview.model.x, ettview.model.y);
    CGPoint lineending = [self.model pointlinedown:linestarting];
    
    mflowlinesitem *line = [self addlinestarting:linestarting ending:lineending];
    line.startingett = ettview.model;
    
    [self.scroll addSubview:ettview];
    
    
    [array addObject:ettmodel];
}

@end