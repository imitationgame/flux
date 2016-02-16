#import "mconfigresolution.h"

@implementation mconfigresolution

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 90;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigsw *overview = [[vconfigsw alloc] init];
    [overview.label setText:NSLocalizedString(@"config_item_hr", nil)];
    [cel changeoverview:overview];
}

@end