#import "mconfigemail.h"

@implementation mconfigemail

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 170;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigemail *email = [[vconfigemail alloc] init];
    [cel changeoverview:email];
}

@end