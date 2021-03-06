#import "mflowett.h"
#import "appdel.h"

@implementation mflowett

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init];
    
    self.flow = flow;
    self.x = point.x;
    self.y = point.y;
    self.linesitemlist = [[mflowlinesitemlist alloc] init:self];
    self.viewclass = [vflowett class];
    self.color = [flow.colors defaultcolor];
    
    return self;
}

#pragma mark public

-(vflowett*)generateview:(NSString*)imagename
{
    [self.view removeFromSuperview];
    vflowett *view = [(vflowett*)[self.viewclass alloc] init:self imagename:imagename];
    [view addTarget:self.flow.view action:@selector(actionett:) forControlEvents:UIControlEventTouchUpInside];
    self.view = view;
    self.text = [[mflowtext alloc] init:self];
    
    return view;
}

-(void)selected:(BOOL)selected
{
    [self.view setSelected:selected];
}

-(void)changecolor:(id<mflowcolorsprotocol>)color
{
    self.color = color;
    [self.view.imageView setTintColor:[color color]];
}

-(NSString*)initialtext
{
    NSString *str = @"";
    
    return str;
}

-(NSTextAlignment)textalign
{
    NSTextAlignment align = NSTextAlignmentLeft;
    
    return align;
}

-(NSInteger)textdeltay
{
    NSInteger delta = 0;
    
    return delta;
}

-(NSInteger)textdeltax
{
    NSInteger delta = 1;
    
    return delta;
}

-(void)remove:(BOOL)addpoint
{
    if(addpoint)
    {
        if(self.prevline)
        {
            [self.flow.points pointatline:self.prevline];
        }
        else
        {
            [self.flow.view addpointatx:self.x y:self.y];
        }
    }
    
    [self.flow.ettlist clean:self];
    [self.linesitemlist remove];
    [self.text remove];
    [self.view removeFromSuperview];
}

@end