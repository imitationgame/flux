#import "mflowetttypespro.h"

@implementation mflowetttypespro

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_pro", nil);
    
    return string;
}

-(UIView*)overview
{
    UIView *view = [[UIView alloc] init];
    
    return view;
}

@end