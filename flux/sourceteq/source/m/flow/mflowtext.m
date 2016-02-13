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
    [self adjusttext];
    
    return self;
}

#pragma mark public

-(void)adjusttext
{
    CGSize textsize = [self.text boundingRectWithSize:CGSizeMake(100, 100) options:stringdrawing attributes:@{NSFontAttributeName:self.view.label.font} context:nil].size;
    
    CGRect rectview = self.ett.view.frame;
    [view setFrame:CGRectMake(rectview.origin.x + rectview.size.width, rectview.origin.y, 120, rectview.size.height)];
}

@end