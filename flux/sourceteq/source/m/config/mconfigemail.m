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
    vconfigemail *email = [[vconfigemail alloc] init];
    [cel changeoverview:email];
}

@end