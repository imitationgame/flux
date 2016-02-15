#import "cflow.h"

@implementation cflow

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.viewflow show];
}

-(void)loadView
{
    self.view = [[vflow alloc] init:self];
    self.viewflow = (vflow*)self.view;
}

#pragma mark public

-(void)exportflow
{
    __block UIImage *image;
    vflowcontent *content = self.viewflow.contentview;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       CGSize size = content.contentSize;
                       CGFloat marginleft = - (CGFloat)content.marginleft;
                       CGFloat margintop = - (CGFloat)content.margintop;
                       CGFloat width = content.width;
                       CGFloat height = content.height;
                       CGRect rect = CGRectMake(marginleft, margintop, width, height);
                       
                       UIGraphicsBeginImageContextWithOptions(size, YES, 1);
                       [content.container drawViewHierarchyInRect:rect afterScreenUpdates:YES];
                       image = UIGraphicsGetImageFromCurrentImageContext();
                       UIGraphicsEndImageContext();
                       
                       NSString *filename = NSLocalizedString(@"flow_exportname", nil);
                       NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
                       NSURL *url = [NSURL fileURLWithPath:filepath];
                       [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.navigationController pushViewController:[[cflowdetail alloc] init:filepath] animated:YES];
                                      });
                   });
    
}

-(void)share
{
    UIImage *image;
    vflowcontent *content = self.viewflow.contentview;
    CGSize size = content.contentSize;
    CGFloat width = size.width;
    CGFloat marginleft = -(CGFloat)content.marginleft;
    CGFloat margintop = -(CGFloat)content.margintop;
    CGFloat totalwidth = content.width;
    CGFloat totalheight = content.height;
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [content.container drawViewHierarchyInRect:CGRectMake(marginleft, margintop, totalwidth, totalheight) afterScreenUpdates:YES];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *filename = NSLocalizedString(@"flow_exportname", nil);
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:filename]];
    
    NSError *error;
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:&error];

    if(error)
    {
        NSLog(@"error!!!");
    }
    
    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = self.viewflow;
        act.popoverPresentationController.sourceRect = CGRectMake((width / 2) - 2, 5, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
}

@end