#import "vflow.h"

@implementation vflow

-(instancetype)init:(cflow*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.controller = controller;
    self.model = [[mflow alloc] init];
    [vflowcontent containerin:self];
    
    return self;
}

#pragma mark actions

-(void)actionpoint:(vflowpoint*)point
{
    [self.model.points selectpoint:point.model];
    [vflowcatalogett catalogin:self];
}

#pragma mark functionality

-(void)showcatalogett
{
    
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

#pragma mark public

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type
{
    [self.catalogett show:NO];
    mflowpointsitem *point = [self.model.points selecteditem];
    vflowett *ettview = [self.model add:type point:point];
    
    CGPoint linestarting = CGPointMake(ettview.model.x, ettview.model.y);
    CGPoint lineending = [self.model pointlinedown:linestarting];
    
    mflowlinesitem *line = [self addlinestarting:linestarting ending:lineending];
    line.startingett = ettview.model;
    
    [self.scroll addSubview:ettview];
    [self.model.points remove:point];
}

@end