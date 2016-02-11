#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

-(instancetype)init
{
    self = [super init];
    
    self.linesitemlist = [[mflowlinesitemlist alloc] init];
    
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