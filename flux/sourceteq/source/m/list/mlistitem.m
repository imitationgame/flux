#import "mlistitem.h"

@implementation mlistitem
{
    CGFloat height;
    BOOL calcheight;
}

-(instancetype)init:(NSString*)path
{
    self = [super init];
    
    self.path = path;
    calcheight = NO;
    height = 0;
    
    return self;
}

#pragma mark public

-(CGFloat)heightforwidth:(CGFloat)width
{
    if(!calcheight)
    {
        if(!width)
        {
            width = 100;
        }
        
        UIImage *image = [UIImage imageNamed:self.path];
        CGFloat delta = image.size.width / width;
        
        if(!delta)
        {
            delta = 1;
        }
        
        height = image.size.height / delta;
        
        calcheight = YES;
    }
    
    return height;
}

@end