#import "mconfigsectioncontact.h"

@implementation mconfigsectioncontact

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"config_header_contact", nil);
    
    return self;
}

@end