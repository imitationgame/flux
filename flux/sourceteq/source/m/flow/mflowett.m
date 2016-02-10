#import "mflowett.h"
#import "vflowett.h"

@implementation mflowett

#pragma mark public

-(vflowett*)generateview
{
    [self.view removeFromSuperview];
    vflowett *view = [[vflowett alloc] init:self];
    self.view = view;
    
    return view;
}

@end