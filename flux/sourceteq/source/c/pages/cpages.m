#import "cpages.h"

@implementation cpages
{
    NSTimer *timer;
}

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    UIBarButtonItem *itemadd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionadd:)];
    self.itemadd = itemadd;
    
    UIBarButtonItem *itemsettings = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:nil];
    self.itemsettings = itemsettings;
    
    UIBarButtonItem *itemlist = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:nil];
    self.itemlist = itemlist;
    
    [self actionlist:nil];
    
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
         [weakself.navigationItem setRightBarButtonItem:nil];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemlist];
     }];
}

-(void)actionlist:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[UIViewController alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
     }];
}

@end