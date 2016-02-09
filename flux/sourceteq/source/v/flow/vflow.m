#import "vflow.h"

@implementation vflow

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    UIScrollView *scroll = [[UIScrollView alloc] init];
    [scroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.scroll = scroll;
    
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    
    [self initial];
    
    return self;
}

#pragma mark functionality

-(void)initial
{
    vflowettcon *connector = [[vflowettcon alloc] init];
    
    [self addSubview:connector];
    
    NSDictionary *views = @{@"con":connector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[con(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[con(50)]" options:0 metrics:metrics views:views]];
}

@end