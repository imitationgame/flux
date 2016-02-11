#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init];
    
    self.flow = flow;
    self.linesitemlist = [[mflowlinesitemlist alloc] init:self];
    self.x = point.x;
    self.y = point.y;
    
    return self;
}

#pragma mark public

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