#import "cconfig.h"

@implementation cconfig

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_main_title", nil)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[analytics singleton] trackscreen:ga_screen_config];
}

-(void)loadView
{
//    self.view = [vcon];
}

@end