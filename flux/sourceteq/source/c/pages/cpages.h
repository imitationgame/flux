#import "appdel.h"

@interface cpages:UIPageViewController<UIAlertViewDelegate>

-(void)addflow;
-(void)showlist;

@property(weak, nonatomic)UIImageView *titleview;
@property(strong, nonatomic)UIBarButtonItem *itemadd;
@property(strong, nonatomic)UIBarButtonItem *itemsettings;
@property(strong, nonatomic)UIBarButtonItem *itemlistright;
@property(strong, nonatomic)UIBarButtonItem *itemlistleft;
@property(strong, nonatomic)UIBarButtonItem *itemshare;

@end