#import "mflowettcon.h"

@implementation mflowettcon

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point
{
    self = [super init:flow atpoint:point];
 
    self.viewclass = [vflowettcon class];
    self.width = 60;
    self.height = 60;
    
    CGPoint linestarting = CGPointMake(ettview.model.x, ettview.model.y);
    CGPoint lineending = [self.model pointlinedown:linestarting];
    
    mflowlinesitem *line = [self addlinestarting:linestarting ending:lineending];
    line.startingett = ettview.model;
    
    return self;
}

@end