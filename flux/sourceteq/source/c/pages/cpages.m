#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self setViewControllers:@[[[clist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    UIBarButtonItem *itemadd = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(actionadd:)];
    self.itemadd = itemadd;
    self.itemadd.imageInsets = UIEdgeInsetsMake(0, -14, 0, 14);
    
    UIBarButtonItem *itemsettings = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(actionconfig:)];
    self.itemsettings = itemsettings;
    self.itemsettings.imageInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    
    UIBarButtonItem *itemlistleft = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"logo"] style:UIBarButtonItemStylePlain target:self action:@selector(actionlistleft:)];
    self.itemlistleft = itemlistleft;
    self.itemlistleft.imageInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    
    UIBarButtonItem *itemlistright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"logo"] style:UIBarButtonItemStylePlain target:self action:@selector(actionlistright:)];
    self.itemlistright = itemlistright;
    self.itemlistright.imageInsets = UIEdgeInsetsMake(0, -14, 0, 14);
    
    UIBarButtonItem *itemshare = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionshare:)];
    self.itemshare = itemshare;
    
    [self.navigationItem setRightBarButtonItem:itemadd];
    [self.navigationItem setLeftBarButtonItem:itemsettings];
    
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [titleview setUserInteractionEnabled:NO];
    [titleview setClipsToBounds:YES];
    [titleview setContentMode:UIViewContentModeScaleAspectFit];
    [titleview setTintColor:[UIColor whiteColor]];
    [titleview setImage:[UIImage imageNamed:@"logo"]];
    [self.navigationItem setTitleView:titleview];
    self.titleview = titleview;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
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
    [self insideaddflow];
}

-(void)actionlistleft:(UIBarButtonItem*)item
{
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"alert_delete_title", nil) message:NSLocalizedString(@"alert_delete_descr", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"alert_cancel", nil) otherButtonTitles:NSLocalizedString(@"alert_delete_ok", nil), nil] show];
}

-(void)actionlistright:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[clist alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
         [weakself.titleview setImage:[UIImage imageNamed:@"logo"]];
     }];
}

-(void)actionconfig:(UIBarButtonItem*)item
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[cconfig alloc] init]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemlistright];
         [weakself.navigationItem setLeftBarButtonItem:nil];
         [weakself.titleview setImage:[UIImage imageNamed:@"settings"]];
     }];
}

-(void)actionshare:(UIBarButtonItem*)item
{
    cflow *controller = self.viewControllers[0];
    [controller exportflow];
}

#pragma mark functionality

-(void)insideaddflow
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[cflow alloc] init]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemshare];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemlistleft];
         [weakself.titleview setImage:[UIImage imageNamed:@"add"]];
     }];
}

-(void)insideshowlistleft
{
    __weak cpages *weakself = self;
    
    [weakself setViewControllers:@[[[clist alloc] init]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:
     ^(BOOL done)
     {
         [weakself.navigationItem setRightBarButtonItem:weakself.itemadd];
         [weakself.navigationItem setLeftBarButtonItem:weakself.itemsettings];
         [weakself.titleview setImage:[UIImage imageNamed:@"logo"]];
     }];
}

#pragma mark public

-(void)addflow
{
    [self insideaddflow];
}

-(void)showlist
{
    [self insideshowlistleft];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [self insideshowlistleft];
    }
}

@end