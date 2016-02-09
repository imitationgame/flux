#import "vflowett.h"

@implementation vflowett

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setBorderWidth:2];
    [self.layer setBorderColor:[UIColor blackColor].CGColor];
    
    return self;
}

@end