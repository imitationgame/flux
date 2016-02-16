#import "mflowdetailexport.h"

@implementation mflowdetailexport

#pragma mark -
#pragma mark flow detail protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"flow_detail_action_export", nil);
    
    return string;
}

-(void)action:(cflowdetail*)controller
{
    
}

@end