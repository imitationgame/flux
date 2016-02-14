#import "vflowfield.h"

@implementation vflowfield

+(void)fieldin:(vflow*)flow
{
    vflowfield *field = [[vflowfield alloc] init:flow];
    [flow addSubview:field];
    
    NSDictionary *views = @{@"field":field};
    NSDictionary *metrics = @{};
    
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[field(130)]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.flow = flow;
    vblur *blur = [vblur light:NO];
    
    [self addSubview:blur];
    
    NSDictionary *views = @{@"blur":blur};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end