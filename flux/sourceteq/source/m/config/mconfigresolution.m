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
    [cel changeoverview:overview];
}

@end