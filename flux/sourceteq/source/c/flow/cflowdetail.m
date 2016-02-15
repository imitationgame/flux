#import "cflowdetail.h"

@implementation cflowdetail

-(instancetype)init:(UIView*)snapshot
{
    self = [super init];
//    self.pathpicture = pathpicture;
    self.snapshot = snapshot;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setTitle:NSLocalizedString(@"flow_detail_title", nil)];
}

-(void)loadView
{
    self.view = [[vflowdetail alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end