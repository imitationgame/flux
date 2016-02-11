#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

-(instancetype)init:(mflow*)flow
{
    self = [super init];
    
    self.flow = flow;
    self.linesitemlist = [[mflowlinesitemlist alloc] init:self];
    
    return self;
}

#pragma mark public

-(void)atpoint:(mflowpointsitem*)point
{
    self.x = point.x;
    self.y = point.y;
}

-(vflowett*)generateview
{
    [self.view removeFromSuperview];
    vflowett *view = [self flowett];
    self.view = view;
    
    return view;
}

-(vflowett*)flowett
{
    vflowett *view = [[vflowett alloc] init:self];
    
    return view;
}

@end