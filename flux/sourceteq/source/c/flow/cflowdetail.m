#import "cflowdetail.h"

@implementation cflowdetail

-(instancetype)init:(NSString*)pathpicture
{
    self = [super init];
    self.pathpicture = pathpicture;
    
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