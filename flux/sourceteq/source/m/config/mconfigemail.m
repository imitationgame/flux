#import "mconfigemail.h"

@implementation mconfigemail

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 120;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigfonts *fonts = [[vconfigfonts alloc] init];
    [cel changeoverview:fonts];
}

@end