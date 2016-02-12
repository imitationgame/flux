#import "vflow.h"

@implementation vflow

-(instancetype)init:(cflow*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.choosing = NO;
    self.controller = controller;
    self.model = [[mflow alloc] init:self];
    [vflowcontent containerin:self];
    [vflowstopchoosing stopchoosing:self];
    
    return self;
}

#pragma mark actions

-(void)actionpoint:(vflowpoint*)point
{
    if(point.model == self.model.points.selected)
    {
        [self clearpoint];
    }
    else
    {
        [self clearcolor];
        [self.model.points selectpoint:point.model];
        [vflowcatalogett catalogin:self];
    }
}

-(void)actionett:(vflowett*)ett
{
    if(ett.model == self.model.ettlist.selected)
    {
        [self clearcolor];
    }
    else
    {
        [self clearpoint];
        [self.model.ettlist selectett:ett.model];
        [vflowcatalogcolor catalogin:ett];
    }
}

#pragma mark functionality

-(void)clearcolor
{
    [self.model.ettlist deselect];
    [self.catalogcolor show:NO];
}

-(void)clearpoint
{
    [self.model.points unselect];
    [self.catalogett show:NO];
}

#pragma mark public

-(void)show
{
    if(![self.model.points count])
    {
        [self addpointatx:self.contentview.centerx y:self.contentview.margintop + 150];
    }
}

-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y
{
    [self.model.points pointat:x y:y];
}

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type
{
    [self.catalogett show:NO];
    [self.model add:type];
}

-(void)choosingmode:(BOOL)mode
{
    self.choosing = mode;
    
    if(mode)
    {
        [self.stopchoosing setHidden:NO];
        [self.catalogcolor setHidden:YES];
        [self.catalogett setHidden:YES];
    }
    else
    {
        [self.stopchoosing setHidden:YES];
        [self.catalogcolor setHidden:NO];
        [self.catalogett setHidden:NO];
    }
}

@end