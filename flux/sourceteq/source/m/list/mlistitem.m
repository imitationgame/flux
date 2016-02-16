#import "mlistitem.h"

@implementation mlistitem

-(instancetype)init:(NSString*)path
{
    self = [super init];
    
    self.path = path;
    
    return self;
}

@end