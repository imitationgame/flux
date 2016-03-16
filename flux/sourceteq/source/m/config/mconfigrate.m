#import "mconfigrate.h"

@implementation mconfigrate

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 120;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigrate *rate = [[vconfigrate alloc] init];
    [cel changeoverview:rate];
}

@end