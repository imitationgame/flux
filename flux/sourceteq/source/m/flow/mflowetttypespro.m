#import "mflowetttypespro.h"

@implementation mflowetttypespro

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_pro", nil);
    
    return string;
}

-(NSString*)imagename
{
    NSString *name = @"process";
    
    return name;
}

-(mflowett*)modelett:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    mflowettcon *ettcon = [[mflowettcon alloc] init:flow atpoint:point];
    
    return ettcon;
}

@end