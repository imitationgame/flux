#import "mflowettcon.h"

@implementation mflowettcon

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
 
    self.viewclass = [vflowettcon class];
    self.width = 120;
    self.height = 120;
    
    [self.linesitemlist linedown];
    
    return self;
}

@end