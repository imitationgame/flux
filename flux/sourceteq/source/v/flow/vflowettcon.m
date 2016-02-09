#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    
    [self.layer setCornerRadius:self.bounds.size.width / 2.0];
}

@end