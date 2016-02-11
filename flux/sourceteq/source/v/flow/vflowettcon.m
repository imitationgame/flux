#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)init:(mflowett*)model imagename:(NSString*)imagename
{
    self = [super init:model imagename:imagename];

    [self setFrame:CGRectMake(0, 0, self.model.width, self.model.height)];
    [self setCenter:CGPointMake(self.model.x, self.model.y)];
    [self.layer setCornerRadius:self.model.width / 2.0];
    
    return self;
}

@end