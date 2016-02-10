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

#pragma mark public

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type
{
    [self.catalogett show:NO];
    vflowett *ettview = [self.model add:type];
    
    
}

@end