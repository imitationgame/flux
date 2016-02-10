#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)init:(mflowett*)model
{
    self = [super init:model];

    [self setFrame:CGRectMake(0, 0, self.model.width, self.model.height)];
    [self setCenter:CGPointMake(self.model.x, self.model.y)];
    [self.layer setCornerRadius:self.model.width / 2.0];
    
    return self;
}

@end