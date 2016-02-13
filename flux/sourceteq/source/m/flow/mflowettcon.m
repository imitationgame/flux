#import "mflowettcon.h"

@implementation mflowettcon
{
    BOOL ending;
}

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
 
    self.viewclass = [vflowettcon class];
    self.width = 150;
    self.height = 150;
    ending = NO;
    
    if(![flow.ettlist count])
    {
        ending = YES;
        [self.linesitemlist linedown];
    }
    
    return self;
}

#pragma mark -
#pragma mark flow ett

-(NSString*)initialtext
{
    NSString *str;
    
    if(ending)
    {
        str = NSLocalizedString(@"flow_etttext_con_end", nil);
    }
    else
    {
        str = NSLocalizedString(@"flow_etttext_con_start", nil);
    }
    
    return str;
}

@end