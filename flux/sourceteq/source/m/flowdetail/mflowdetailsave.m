#import "mflowdetailsave.h"

@implementation mflowdetailsave

#pragma mark -
#pragma mark flow detail protocol

-(NSString*)title
{
    NSString *string = NSLocalizedString(@"flow_detail_action_save", nil);
    
    return string;
}

-(void)action:(cflowdetail*)controller
{
    
}

@end