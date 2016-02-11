#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

+(void)ett:(id<mflowetttypesprotocol>)type at:(mflowpointsitem*)point flow:(vflow*)flow
{
    mflowett *ettmodel = [type modelett];
    [ettmodel atpoint:point];
    vflowett *ettview = [ettmodel generateview];
    
    [array addObject:ettmodel];
    
    return ettview;
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