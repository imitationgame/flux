#import "mflowettcon.h"

@implementation mflowettcon

#pragma mark flow ett

-(void)atpoint:(mflowpointsitem*)point
{
    [super atpoint:point];
    
    self.width = 60;
    self.height = 60;
}

-(vflowett*)flowett
{
    vflowettcon *view = [[vflowettcon alloc] init:self];
    
    return view;
}

@end