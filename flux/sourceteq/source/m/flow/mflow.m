#import "mflow.h"

@implementation mflow

-(instancetype)init:(vflow*)view
{
    self = [super init];
    
    self.view = view;
    self.width = 0;
    self.height = 0;
    self.ettlist = [[mflowettlist alloc] init:self];
    self.points = [[mflowpoints alloc] init:self];
    self.lines = [[mflowlines alloc] init:self];
    self.colors = [[mflowcolors alloc] init:self];
    
    return self;
}

#pragma mark functionality

#pragma mark public

-(void)add:(id<mflowetttypesprotocol>)type
{
    mflowpointsitem *point = self.points.selected;
    [self.ettlist add:type point:point];
    [self.points remove:point];
}

@end