#import "mflowetttypesdec.h"

@implementation mflowetttypesdec

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_dec", nil);
    
    return string;
}

-(NSString*)imagename
{
    NSString *name = @"decision";
    
    return name;
}

@end