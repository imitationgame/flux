#import "cpages.h"

@implementation cpages
{
    NSTimer *timer;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"app_title", nil)];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end