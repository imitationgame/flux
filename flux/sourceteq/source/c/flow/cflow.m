#import "cflow.h"

@implementation cflow

-(void)loadView
{
    self.view = [[vflow alloc] init];
    self.viewflow = (vflow*)self.view;
}

#pragma mark public

-(void)share
{
    UIImage *image;
    
    CGSize size = self.viewflow.scroll.contentSize;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    [self.viewflow drawViewHierarchyInRect:CGRectMake(0, 0, width, height) afterScreenUpdates:YES];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [tools ];
}

@end