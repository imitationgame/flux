#import "cflow.h"

@implementation cflow

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"flow_main_title", nil)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[analytics singleton] trackscreen:ga_screen_list];
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
    [self.viewflow startloading];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 300), dispatch_get_main_queue(),
                   ^
                   {
                       UIImage *image;
                       vflowcontent *content = self.viewflow.contentview;
                       CGRect originalrect = content.frame;
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
                       UIGraphicsBeginImageContextWithOptions(CGSizeMake(contentwidth, contentheight), YES, 0.0f);
                       
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
                       
                       [content setFrame:originalrect];
                       NSString *filename = NSLocalizedString(@"flow_exportname", nil);
                       NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
                       NSURL *url = [NSURL fileURLWithPath:filepath];
                       [UIImagePNGRepresentation(image) writeToURL:url options:NSDataWritingAtomic error:nil];
                       
                       [self.viewflow stoploading];
                       [self.navigationController pushViewController:[[cflowdetail alloc] init:filepath] animated:YES];
                   });
}

@end