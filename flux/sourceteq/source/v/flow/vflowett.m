#import "vflowett.h"

@implementation vflowett

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self.layer setBorderWidth:2];
    [self.layer setBorderColor:[UIColor blackColor].CGColor];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end