#import "vflow.h"

@implementation vflow

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.width = 0;
    self.height = 0;
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [self addSubview:container];
    [self addSubview:[[vflowpoint alloc] init:60 y:60]];
    
    return self;
}

-(void)layoutSubviews
{
    
    
    [super layoutSubviews];
}

#pragma mark functionality

-(void)updateheight:(CGFloat)height
{
    [self setContentSize:CGSizeMake(self.width, self.height)];
    [self.container setFrame:CGRectMake(0, 0, self.width, self.height)];
}

-(void)initial
{
    vflowettcon *connector = [[vflowettcon alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.container addSubview:connector];
    
    [self updateheight:500];
}

@end