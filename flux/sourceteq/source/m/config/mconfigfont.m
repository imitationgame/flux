#import "mconfigfont.h"

@implementation mconfigfont

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 140;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigfonts *fonts = [[vconfigfonts alloc] init];
    [cel changeoverview:fonts];
}

@end