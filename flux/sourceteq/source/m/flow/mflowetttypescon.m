#import "mflowetttypescon.h"

@implementation mflowetttypescon

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_con", nil);
    
    return string;
}

-(NSString*)imagename
{
    NSString *name = @"connector";
    
    return name;
}

-(mflowett*)modelett:(mflow*)flow
{
    mflowettcon *ettcon = [[mflowettcon alloc] init:flow];
    
    return ettcon;
}

@end