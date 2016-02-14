#import "vflowfield.h"

@implementation vflowfield

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.flow = flow;
    vblur *blur = [vblur light:NO];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{};
    NSDictionary *metrics
    
    return self;
}

@end