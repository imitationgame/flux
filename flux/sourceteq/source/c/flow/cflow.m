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
    UIImage *image;
    vflowcontent *content = self.viewflow.contentview;
    CGSize size = content.contentSize;
    CGFloat contentwidth = size.width;
    CGFloat contentheight = size.height;
    CGFloat marginleft = (-(CGFloat)content.marginleft);
    CGFloat margintop = (-(CGFloat)content.margintop);
    CGFloat width = content.width;
    CGFloat height = content.height;
    CGRect rect = CGRectMake(marginleft, margintop, width, height);
    size = CGSizeMake(contentwidth, contentheight);
//    CGFloat snapwidth = snap.frame.size.width / 1;
//    CGFloat snapheight = snap.frame.size.height / 1;
//    [snap setFrame:CGRectMake(0, 0, snapwidth, snapheight)];
    
    
    UIView *snip = [content.container resizableSnapshotViewFromRect:CGRectMake(500, 1000, 500, 500) afterScreenUpdates:YES withCapInsets:UIEdgeInsetsZero];
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1000, 1000), YES, 1);
    [snip drawViewHierarchyInRect:CGRectMake(0, 0, 500, 500) afterScreenUpdates:YES];
//    [content.container snapshotViewAfterScreenUpdates];
//    [content.container.layer renderInContext:UIGraphicsGetCurrentContext()];
    image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    [imageview setFrame:CGRectMake(0, 0, 500, 500)];
    [self.view addSubview:imageview];
    /*
    [snip setFrame:CGRectMake(0, 0, 1500, 1500)];
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    [snip drawViewHierarchyInRect:CGRectMake(0, 0, contentwidth, contentheight) afterScreenUpdates:YES];
//    [snap.layer renderInContext:UIGraphicsGetCurrentContext()];
//    [content.container drawViewHierarchyInRect:CGRectMake(0, 0, size.width, size.height) afterScreenUpdates:YES];
//    [content.container.layer renderInContext:UIGraphicsGetCurrentContext()];
    //                       [snapcontainer drawViewHierarchyInRect:CGRectMake(0, 0, size.width, size.height) afterScreenUpdates:YES];
    //    [content.container drawViewHierarchyInRect:rect afterScreenUpdates:YES];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *filename = NSLocalizedString(@"flow_exportname", nil);
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:filepath];
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
    
    [self.navigationController pushViewController:[[cflowdetail alloc] init:filepath] animated:YES];
     
     */
}

-(void)share
{
    UIImage *image;
    vflowcontent *content = self.viewflow.contentview;
    CGSize size = content.contentSize;
    CGFloat width = size.width / 10.0;
    CGFloat height = size.height / 10.0;
    CGFloat marginleft = (-(CGFloat)content.marginleft) / 10.0;
    CGFloat margintop = (-(CGFloat)content.margintop) / 10.0;
    CGFloat totalwidth = content.width / 10.0;
    CGFloat totalheight = content.height / 10.0;
    size = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
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