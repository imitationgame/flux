#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)init
{
    self = [super init];
    
    return self;
}

-(void)layoutSubviews
{
    [self.layer setCornerRadius:self.bounds.size.width / 2.0];
    
    [super layoutSubviews];
}

@end