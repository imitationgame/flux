#import "mflowetttypesio.h"

@implementation mflowetttypesio

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_io", nil);
    
    return string;
}

-(NSString*)imagename
{
    NSString *name = @"io";
    
    return name;
}

-(mflowett*)modelett:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    mflowettio *ettcon = [[mflowettio alloc] init:flow atpoint:point];
    
    return ettcon;
}

@end