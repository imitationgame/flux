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
    CGFloat basesize = 100;
    CGFloat scrollwidth = basesize;
    CGFloat scrollheight = basesize;
    CGFloat contentwidth = size.width;
    CGFloat contentheight = size.height;
    
    if(scrollwidth > contentwidth)
    {
        scrollwidth = contentwidth;
    }
    
    if(scrollheight > contentheight)
    {
        scrollheight = contentheight;
    }
    
    CGFloat adwidth = 0;
    CGFloat adheight = 0;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(contentwidth, contentheight), YES, 1);

    while(adheight < contentheight)
    {
        while(adwidth < contentwidth)
        {
            CGRect rectscroll = CGRectMake(0, 0, scrollwidth, scrollheight);
            CGRect realrect = CGRectMake(adwidth, adheight, scrollwidth, scrollheight);
            
            [content setFrame:rectscroll];
            [content scrollRectToVisible:realrect animated:NO];
            [content drawViewHierarchyInRect:realrect afterScreenUpdates:YES];
            
            adwidth += scrollwidth;
            
            if(adwidth + scrollwidth > contentwidth)
            {
                scrollwidth = contentwidth - adwidth;
            }
        }
        
        adwidth = 0;
        scrollwidth = basesize;
        adheight += scrollheight;
        
        if(adheight + scrollheight > contentheight)
        {
            scrollheight = contentheight - adheight;
        }
    }
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSString *filename = NSLocalizedString(@"flow_exportname", nil);
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
    NSURL *url = [NSURL fileURLWithPath:filepath];
    [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
    
    [self.navigationController pushViewController:[[cflowdetail alloc] init:filepath] animated:YES];
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