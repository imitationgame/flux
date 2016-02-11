#import "vflowett.h"
#import "appdel.h"

@implementation vflowett

-(instancetype)init:(mflowett*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[model.color color]];
    
    self.model = model;
    self.flowview = model.flow.view;
    
    return self;
}

@end