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
    ending = YES;
    
    if(![flow.ettlist count])
    {
        ending = NO;
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

-(NSTextAlignment)textalign
{
    NSTextAlignment align = NSTextAlignmentCenter;
    
    return align;
}

-(NSInteger)textdeltay
{
    NSInteger delta;
    
    if(ending)
    {
        delta = 1;
    }
    else
    {
        delta = -1;
    }
    
    return delta;
}

-(NSInteger)textdeltax
{
    NSInteger delta = 0;
    
    return delta;
}

@end