#import "vflow.h"

@implementation vflow

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [self addSubview:container];
    [self initial];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [self initial];
                   });
    
    return self;
}

#pragma mark functionality

-(void)updateheight:(CGFloat)height
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       CGFloat width = self.bounds.size.width;
                       
                       [self setContentSize:CGSizeMake(width, height)];
                       [self.container setFrame:CGRectMake(0, 0, width, height)];
                   });
}

-(void)initial
{
    vflowettcon *connector = [[vflowettcon alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.container addSubview:connector];
    
    [self updateheight:500];
}

@end