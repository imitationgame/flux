#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init];
    
    self.flow = flow;
    self.x = point.x;
    self.y = point.y;
    self.linesitemlist = [[mflowlinesitemlist alloc] init:self];
    self.viewclass = [vflowett class];
    self.color = [flow.colors defaultcolor];
    
    return self;
}

#pragma mark public

-(vflowett*)generateview
{
    [self.view removeFromSuperview];
    vflowett *view = [(vflowett*)[self.viewclass alloc] init:self];
    self.view = view;
    
    return view;
}

@end