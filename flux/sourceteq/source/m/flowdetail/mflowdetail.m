#import "mflowdetail.h"

@implementation mflowdetail
{
    NSArray *array;
}

-(instancetype)init:(BOOL)saved
{
    self = [super init];
    
    self.items = [NSMutableArray array];
    
    if(!saved)
    {
        [self.items addObject:[[mflowdetailsave alloc] init]];
    }
    
    [self.items addObject:[[mflowdetailexport alloc] init]];
    
    return self;
}

@end