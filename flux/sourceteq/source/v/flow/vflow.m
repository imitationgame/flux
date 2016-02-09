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
    
    UIView *container = [[UIView alloc] init];
    [container setTranslatesAutoresizingMaskIntoConstraints:NO];
    [container setClipsToBounds:YES];
    self.container = container;
    
    [scroll addSubview:container];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"scroll":scroll, @"container":container};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[container]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[container]-0-|" options:0 metrics:metrics views:views]];
    
    [self initial];
    
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    
    [self updateheight:500];
}

#pragma mark functionality

-(void)updateheight:(CGFloat)height
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       CGFloat width = self.container.bounds.size.width;
                       
                       [self.scroll setContentSize:CGSizeMake(width, height)];
                       [self.container setFrame:CGRectMake(0, 0, width, height)];
                   });
}

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