#import "clist.h"

@implementation clist

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_list];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [((vlist*)self.view).collection reloadData];
}

-(void)loadView
{
    self.view = [[vlist alloc] init:self];
}

@end