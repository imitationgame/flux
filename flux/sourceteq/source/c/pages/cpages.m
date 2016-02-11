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
    
    UIBarButtonItem *itemlist = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(actionlist:)];
    self.itemlist = itemlist;
    
    UIBarButtonItem *itemshare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionshare:)];
    self.itemshare = itemshare;
    
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
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[cflow alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemshare];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemlist];
     }];
}

-(void)actionlist:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
     }];
}

-(void)actionshare:(UIBarButtonItem*)item
{
    cflow *controller = self.viewControllers[0];
    [controller share];
}

@end