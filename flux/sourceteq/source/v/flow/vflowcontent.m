#import "vflowcontent.h"

@implementation vflowcontent

+(void)containerin:(vflow*)flow
{
    vflowcontent *content = [[vflowcontent alloc] init];
    flow.contentview = content;
    
    NSDictionary *views = @{@"scroll":self};
    NSDictionary *metrics = @{};
    
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [self addSubview:container];
    
    return self;
}

#pragma mark public

-(void)addview:(UIView*)view
{
    [self.container addSubview:view];
}

@end