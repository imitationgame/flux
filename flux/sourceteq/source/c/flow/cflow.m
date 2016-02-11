#import "cflow.h"

@implementation cflow

-(void)loadView
{
    self.view = [[vflow alloc] init:self];
    self.viewflow = (vflow*)self.view;
}

#pragma mark public

-(void)share
{
    UIImage *image;
 /*
    CGSize size = self.viewflow.container.bounds.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [self.viewflow.container drawViewHierarchyInRect:CGRectMake(0, 0, width, height) afterScreenUpdates:YES];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *filename = @"flowchart.png";
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:filename]];
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];

    UIActivityViewController *act = [[UIActivityViewController alloc] initWithActivityItems:@[url] applicationActivities:nil];
    
    if([UIPopoverPresentationController class])
    {
        act.popoverPresentationController.sourceView = self.viewflow;
        act.popoverPresentationController.sourceRect = CGRectMake((width / 2) - 2, 5, 1, 1);
        act.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp | UIPopoverArrowDirectionDown;
    }
    
    [[cmain singleton] presentViewController:act animated:YES completion:nil];
  */
    
#warning "needs revision"
}

@end