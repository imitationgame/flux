#import "mconfig.h"

@implementation mconfig

-(instancetype)init
{
    self = [super init];
    
    self.sections = @[
                      [[mconfigsectionsettings alloc] init],
                      [[mconfigsectioncontact alloc] init],
                      ];
    
    return self;
}

@end