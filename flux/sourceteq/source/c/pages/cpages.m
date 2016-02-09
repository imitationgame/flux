#import "cpages.h"

@implementation cpages
{
    NSTimer *timer;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    UIBarButtonItem *itemadd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionadd:)];
    self.itemadd = itemadd;
    
    UIBarButtonItem *itemsettings = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:nil];
    self.itemsettings = itemsettings;
    
    [self.navigationItem setRightBarButtonItem:itemadd];
    [self.navigationItem setLeftBarButtonItem:itemsettings];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"app_title", nil)];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark actions

-(void)actionadd:(UIBarButtonItem*)item
{
    [self setViewControllers:@[[[cflow alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         
     }];
}

@end