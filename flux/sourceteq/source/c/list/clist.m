#import "clist.h"

@implementation clist

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"list_main_title", nil)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[analytics singleton] trackscreen:ga_screen_list];
    
    [((vlist*)self.view).collection reloadData];
}

-(void)loadView
{
    self.view = [[vlist alloc] init:self];
}

@end