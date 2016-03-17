#import "cconfig.h"

@implementation cconfig

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_config];
}

-(void)loadView
{
    self.view = [[vconfig alloc] init:self];
}

@end