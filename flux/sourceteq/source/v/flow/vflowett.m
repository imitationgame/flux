#import "vflowett.h"
#import "appdel.h"

@implementation vflowett

-(instancetype)init:(mflowett*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    
    self.model = model;
    
    return self;
}

@end