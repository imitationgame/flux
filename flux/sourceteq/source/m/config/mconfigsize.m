#import "mconfigsize.h"

@implementation mconfigsize

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 90;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigstep *step = [[vconfigstep alloc] init];
    [step.label setText:NSLocalizedString(@"config_item_size", nil)];
    [cel changeoverview:step];
}

@end