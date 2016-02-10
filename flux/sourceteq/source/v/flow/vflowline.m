#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    
    return self;
}

@end