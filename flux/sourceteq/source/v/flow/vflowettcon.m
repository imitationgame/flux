#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)init:(mflowett*)model
{
    self = [super init:model];
    
    CGFloat width = 60;
    CGFloat height = 60;
    
    [self setFrame:CGRectMake(0, 0, width, height)];
    [self setCenter:CGPointMake(self.model.x, self.model.y)];
    [self.layer setCornerRadius:frame.size.width / 2.0];
    
    return self;
}

@end