#import "cmain.h"

@implementation cmain

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super initWithRootViewController:[[cpages alloc] init]];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundColor:[UIColor whiteColor]];
    [self.navigationBar setBarTintColor:colormain];
    [self.navigationBar setTintColor:colormain];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontname size:18], NSForegroundColorAttributeName:colormain}];
    [self.navigationBar setTranslucent:NO];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:fontname size:18], NSForegroundColorAttributeName:colormain} forState:UIControlStateNormal];
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