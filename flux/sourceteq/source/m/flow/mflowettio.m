#import "mflowettio.h"

@implementation mflowettio

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
    
    self.viewclass = [vflowettcon class];
    self.width = 150;
    self.height = 150;
    
    [self.linesitemlist linedown];
    
    return self;
}

#pragma mark -
#pragma mark flow ett

-(NSString*)initialtext
{
    NSString *str = NSLocalizedString(@"flow_etttext_io", nil);
    
    return str;
}

@end