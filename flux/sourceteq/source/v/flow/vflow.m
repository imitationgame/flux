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
    [vflowfield fieldin:self];
    
    return self;
}

#pragma mark actions

-(void)actionpoint:(vflowpoint*)point
{
    if(!self.choosing)
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
}

-(void)actionett:(vflowett*)ett
{
    if(self.choosing)
    {
        mflowpointsitem *pointselected = self.model.points.selected;
        mflowlinesitem *line = pointselected.line;
        
        if(ett.model != line.startingett)
        {
            [self.model.points remove:pointselected];
            [self clearpoint];
            [self clearcolor];
            [self choosingmode:NO];
            
            CGPoint point = CGPointMake(ett.model.x, ett.model.y);
            
            [line connecttopoint:point];
        }
    }
    else
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
}

#pragma mark public

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

-(void)cleartext
{
    [self.field.field resignFirstResponder];
}

-(void)show
{
    if(![self.model.points count])
    {
        [self addpointatx:self.contentview.centerx y:self.contentview.margintop + 200];
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