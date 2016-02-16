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
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *identifier = [[NSProcessInfo processInfo] globallyUniqueString];
                       NSString *newpath = [flowsfolder stringByAppendingPathComponent:identifier];
                       
                       NSInteger now = [NSDate date].timeIntervalSince1970;
                       [mdirs copyfilefrom:controller.pathpicture to:newpath];
                       NSString *query = [NSString stringWithFormat:
                                          @"INSERT INTO flows (created, path) "
                                          "values(%@, \"%@\");",
                                          @(now), identifier];
                       [db query:query];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notflowschanged object:nil];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [controller.navigationController popViewControllerAnimated:YES];
                                      });
                   });
}

@end