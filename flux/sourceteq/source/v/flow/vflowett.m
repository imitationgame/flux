#import "vflowett.h"
#import "appdel.h"

@implementation vflowett

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    
    return self;
}

@end