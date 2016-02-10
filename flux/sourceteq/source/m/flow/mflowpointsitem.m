#import "mflowpointsitem.h"

@implementation mflowpointsitem

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y
{
    self = [super init];

    self.x = x;
    self.y = y;
    
    return self;
}

@end