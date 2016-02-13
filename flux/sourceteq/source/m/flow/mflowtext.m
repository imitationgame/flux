#import "mflowtext.h"

@implementation mflowtext

-(instancetype)init:(mflowett*)ett
{
    self = [super init];
    self.ett = ett;
    self.text = [ett initialtext];
    
    vflowtext *view = [[vflowtext alloc] init:self];
    self.view = view;
    [ett.flow.view.contentview addSubview:view];
    
    return self;
}

@end