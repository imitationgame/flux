#import "vflow.h"

@implementation vflow

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    UIScrollView *scroll = [[UIScrollView alloc] init];
    self.scroll = scroll;
    
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)initial
{
    
}

@end