#import "vflow.h"

@implementation vflow

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.model = [[mflow alloc] init];
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [self addSubview:container];
    
    return self;
}

-(void)layoutSubviews
{
    [self initialpoint];
    [super layoutSubviews];
}

#pragma mark functionality

-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y
{
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:x y:y];
    vflowpoint *viewpoint = [modelpoint generateview];
    
    [self.model.points add:modelpoint];
    [self addSubview:viewpoint];
}

-(void)initialpoint
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       NSUInteger width = self.bounds.size.width;
                       [self addpointatx:width / 2 y:100];
                   });
}

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