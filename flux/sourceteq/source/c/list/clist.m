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
}

-(void)loadView
{
    self.view = [[vlist alloc] init:self];
}

@end