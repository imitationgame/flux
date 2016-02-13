#import "mflowettdec.h"

@implementation mflowettdec

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
    
    self.viewclass = [vflowettcon class];
    self.width = 150;
    self.height = 150;
    
    [self.linesitemlist linesparting];
    
    return self;
}

#pragma mark -
#pragma mark flow ett

-(NSString*)initialtext
{
    NSString *str = NSLocalizedString(@"flow_etttext_dec", nil);
    
    return str;
}

-(NSTextAlignment)textalign
{
    NSTextAlignment align = NSTextAlignmentCenter;
    
    return align;
}

-(NSInteger)textdeltay
{
    NSInteger delta = 1;
    
    return delta;
}

-(NSInteger)textdeltax
{
    NSInteger delta = 0;
    
    return delta;
}

@end