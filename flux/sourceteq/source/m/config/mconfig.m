#import "mconfig.h"

@implementation mconfig

-(instancetype)init
{
    self = [super init];
    
    array = [NSArray arrayWithObjects:
             [[mconfigresolution alloc] init],
             [[mconfigsize alloc] init],
             [[mconfigfont alloc] init],
             nil];
    
    return self;
}

@end