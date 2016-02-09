#import "vflowettcon.h"

@implementation vflowettcon

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self.layer setCornerRadius:frame.size.width / 2.0];
    
    return self;
}

@end