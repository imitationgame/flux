#import "mconfigsectioncontact.h"

@implementation mconfigsectioncontact

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"config_header_contact", nil);
    self.items = @[
                   [[mconfigreview alloc] init],
                   [[mconfigrate alloc] init]
                   ];
    
    return self;
}

@end