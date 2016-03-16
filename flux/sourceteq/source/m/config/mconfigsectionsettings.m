#import "mconfigsectionsettings.h"

@implementation mconfigsectionsettings

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"config_header_settings", nil);
    self.items = @[
                   [[mconfigresolution alloc] init],
                   [[mconfigsize alloc] init],
                   [[mconfigfont alloc] init]
                   ];
    
    return self;
}

@end