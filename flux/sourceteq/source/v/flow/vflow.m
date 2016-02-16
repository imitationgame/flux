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
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [spinner setTranslatesAutoresizingMaskIntoConstraints:NO];
    [spinner setUserInteractionEnabled:NO];
    [spinner setHidden:YES];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    
    NSDictionary *views = @{@"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    
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
            [self cleartext];
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
            [self cleartext];
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
            [self cleartext];
            [self.model.ettlist selectett:ett.model];
            [vflowcatalogcolor catalogin:ett];
        }
    }
}

-(void)actiontext:(vflowtext*)text
{
    if(!self.choosing)
    {
        if(self.field.flowtext)
        {
            [self cleartext];
        }
        else
        {
            [self clearcolor];
            [self clearpoint];
            
            [self.field edit:text];
            [text editstart];
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

-(void)startloading
{
    [self clearcolor];
    [self clearpoint];
    [self cleartext];
    
    [self.contentview setHidden:YES];
    [self.spinner setHidden:NO];
    [self.spinner startAnimating];
}

-(void)stoploading
{
    [self.spinner stopAnimating];
    [self.spinner setHidden:YES];
    [self.contentview setHidden:NO];
}

@end