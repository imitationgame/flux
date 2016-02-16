#import "vconfigfonts.h"

@implementation vconfigfonts

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.model = [[mconfigfonts alloc] init];
    
    return self;
}

@end