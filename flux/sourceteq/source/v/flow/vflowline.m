#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    
    [self setFrame:CGRectMake(model.starting.x, model.starting.y, model.ending.x, <#CGFloat height#>)];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
}

@end