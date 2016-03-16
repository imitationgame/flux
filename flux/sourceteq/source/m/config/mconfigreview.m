#import "mconfigreview.h"

@implementation mconfigreview

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 120;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigreview *review = [[vconfigreview alloc] init];
    [cel changeoverview:review];
}

@end