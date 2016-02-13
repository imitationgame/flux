#import "mflowtext.h"

@implementation mflowtext

-(instancetype)init:(mflowett*)ett
{
    self = [super init];
    self.ett = ett;
    self.text = [ett initialtext];
    
    vflowtext *view = [[vflowtext alloc] init:self];
    
    CGRect rectview = ett.view.frame;
    [view setFrame:CGRectMake(rectview.origin.x + rectview.size.width, rectview.origin.y, 120, rectview.size.height)];
    self.view = view;
    [ett.flow.view.contentview addSubview:view];
    
    return self;
}

@end