#import "mflowettdec.h"

@implementation mflowettdec

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
    
    self.viewclass = [vflowettcon class];
    self.width = 150;
    self.height = 150;
    
    [self.linesitemlist linesparting];
    
    return self;
}

@end