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
    vflowcontent *content = self.viewflow.contentview;
    UIView *snapshot = [content.container snapshotViewAfterScreenUpdates:YES];
    CGFloat x = snapshot.frame.origin.x;
    CGFloat y = snapshot.frame.origin.y;
    CGFloat width = content.contentSize.width;
    CGFloat height = content.contentSize.height;
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [scroll setContentSize:CGSizeMake(width, height)];
    [scroll addSubview:snapshot];
    [scroll setBackgroundColor:[UIColor whiteColor]];
    [snapshot setFrame:CGRectMake(-(CGFloat)content.marginleft, -(CGFloat)content.margintop, content.width, content.height)];
    
    UIView *snapshot2 = [scroll snapshotViewAfterScreenUpdates:YES];
    
    [self.navigationController pushViewController:[[cflowdetail alloc] init:snapshot2] animated:YES];
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