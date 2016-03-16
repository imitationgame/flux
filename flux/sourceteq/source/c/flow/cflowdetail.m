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
    [self setTitle:NSLocalizedString(@"flow_detail_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_detail];
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