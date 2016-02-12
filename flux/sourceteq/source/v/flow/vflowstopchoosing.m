#import "vflowstopchoosing.h"

@implementation vflowstopchoosing

+(void)stopchoosing:(vflow*)flow;
{
    vflowstopchoosing *stop = [[vflowstopchoosing alloc] init:flow];
    [flow addSubview:stop];
    flow.stopchoosing = stop;
    
    NSDictionary *views = @{@"stop":stop};
    NSDictionary *metrics = @{};
    
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[stop]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[stop(40)]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setHidden:YES];
    
    self.flow = flow;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:[UIColor clearColor]];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:14]];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"flow_catalog_connect_cancel", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionstop:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button(150)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)actionstop:(UIButton*)button
{
    [self.flow choosingmode:NO];
}

@end