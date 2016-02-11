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
    
    return view;
}

-(void)selected:(BOOL)selected
{
    
}

-(void)changecolor:(id<mflowcolorsprotocol>)color
{
    self.color = color;
    [self.view.imageView setTintColor:[color color]];
}

@end