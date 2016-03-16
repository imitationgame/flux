#import "mconfigsectionsettings.h"

@implementation mconfigsectionsettings

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"config_header_settings", nil);
    
    return self;
}

@end