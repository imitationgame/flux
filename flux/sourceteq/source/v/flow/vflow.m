#import "vflow.h"

@implementation vflow
{
    BOOL initialized;
}

-(instancetype)init:(cflow*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.controller = controller;
    initialized = NO;
    self.model = [[mflow alloc] init];
    self.deltaline = 150;
    self.pointmargin = 50;
    
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    [scroll setClipsToBounds:YES];
    self.scroll = scroll;
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [scroll addSubview:container];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    if(!initialized)
    {
        initialized = YES;
        [self initialpoint];
    }
    
    [super layoutSubviews];
}

#pragma mark actions

-(void)actionpoint:(vflowpoint*)point
{
    [self.model.points unselectall];
    [point setSelected:YES];
    
    [self showcatalogett];
}

#pragma mark functionality

-(void)showcatalogett
{
    if(!self.catalogett)
    {
        vflowcatalogett *catalogett = [[vflowcatalogett alloc] init:self];
        self.catalogett = catalogett;
        [self addSubview:catalogett];
        
        [catalogett show:YES];
        
        NSDictionary *views = @{@"catalog":catalogett};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[catalog]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[catalog(80)]-20-|" options:0 metrics:metrics views:views]];
    }
}

-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y
{
    mflowpointsitem *modelpoint = [[mflowpointsitem alloc] init:x y:y];
    vflowpoint *viewpoint = [modelpoint generateview];
    [viewpoint addTarget:self action:@selector(actionpoint:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.model.points add:modelpoint];
    [self.scroll addSubview:viewpoint];
}

-(mflowlinesitem*)addlinestarting:(CGPoint)starting ending:(CGPoint)ending
{
    mflowlinesitem *linemodel = [[mflowlinesitem alloc] init:starting ending:ending];
    vflowline *lineview = [linemodel generateview];
    
    [self.model.lines add:linemodel];
    [self.scroll addSubview:lineview];
    
    return linemodel;
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
    [self.scroll setContentSize:CGSizeMake(self.width, self.height)];
    [self.container setFrame:CGRectMake(0, 0, self.width, self.height)];
}

-(BOOL)validatepointat:(CGPoint)point
{
    BOOL valid = YES;
    
    return NO;
}

#pragma mark public

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type
{
    [self.catalogett show:NO];
    mflowpointsitem *point = [self.model.points selecteditem];
    vflowett *ettview = [self.model add:type point:point];
    
    mflowlinesitem *line = [self addlinestarting:CGPointMake(ettview.model.x, ettview.model.y) ending:CGPointMake(ettview.model.x, ettview.model.y + 100)];
    line.startingett = ettview.model;
    
    [self.scroll addSubview:ettview];
    [self.model.points remove:point];
}

-(CGPoint)pointlinedown:(CGPoint)point
{
    CGPoint endingpoint;
    
    BOOL valid = NO;
    
    do
    {
        endingpoint = CGPointMake(point.x, point.y + self.deltaline);
    }
    while(!valid);
    
    return endingpoint;
}

-(CGPoint)pointlineleft:(CGPoint)point
{
    CGPoint endingpoint;
    
    return endingpoint;
}

-(CGPoint)pointlineright:(CGPoint)point
{
    CGPoint endingpoint;
    
    return endingpoint;
}

@end