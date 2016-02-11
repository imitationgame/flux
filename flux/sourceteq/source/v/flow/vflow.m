#import "vflow.h"

@implementation vflow

-(instancetype)init:(cflow*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.controller = controller;
    self.model = [[mflow alloc] init:self];
    [vflowcontent containerin:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [self addpointatx:self.contentview.centerx y:100];
                   });
    
    return self;
}

#pragma mark actions

-(void)actionpoint:(vflowpoint*)point
{
    [self.model.points selectpoint:point.model];
    [vflowcatalogett catalogin:self];
}

#pragma mark functionality

-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y
{
    [self.model.points pointat:x y:y];
}

#pragma mark public

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type
{
    [self.catalogett show:NO];
    [self.model add:type];
}

@end