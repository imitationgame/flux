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

-(mflowett*)modelett
{
    mflowett *ett = [[mflowett alloc] init];
    
    return ett;
}

@end