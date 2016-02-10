#import "mflowetttypescon.h"

@implementation mflowetttypescon

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_con", nil);
    
    return string;
}

-(UIView*)overview
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}

@end