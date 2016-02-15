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
    point.line.endingett = ettmodel;
    ettmodel.prevline = point.line;
    vflowett *ettview = [ettmodel generateview:[type imagename]];
    [array addObject:ettmodel];
    
    [self.flow.view.contentview addSubview:ettview];
}

-(void)selectett:(mflowett*)ett
{
    [self.selected selected:NO];
    self.selected = ett;
    [ett selected:YES];
}

-(void)deselect
{
    [self.selected selected:NO];
    self.selected = nil;
}

-(void)removeett:(mflowett*)ett
{
    [self.flow.view clearcolor];
    [ett remove];
}

@end