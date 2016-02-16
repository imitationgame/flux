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
    [[analytics singleton] trackevent:ga_event_export action:ga_action_done label:nil];
    
    NSURL *url = [NSURL fileURLWithPath:controller.pathpicture];
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = controller.view;
        act.popoverPresentationController.sourceRect = CGRectMake((controller.view.bounds.size.width / 2.0) - 2, controller.view.bounds.size.height - 100, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

@end