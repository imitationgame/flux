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
    mflowett *ettmodel = [type modelett:self.flow atpoint:point];
    vflowett *ettview = [ettmodel generateview];
    [array addObject:ettmodel];
    
    [self.flow.view.contentview addSubview:ettview];
}

-(void)selectett:(mflowett*)ett
{
    self.selected = ett;
}

-(void)deselect
{
    self.selected = nil;
}

@end