#import "vflowtext.h"

@implementation vflowtext
{
    UIColor *color;
}

-(instancetype)init:(mflowtext*)model
{
    self = [super init];
    
    self.model = model;
    
    color = [UIColor colorWithWhite:0 alpha:0.5];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setText:model.text];
    [label setFont:[UIFont fontWithName:fontname size:15]];
    [label setTextColor:color];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:[model.ett textalign]];
    self.label = label;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self action:@selector(actionbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionbutton:(UIButton*)button
{
    [self.label setTextColor:colormain];
    [self.model.ett.flow.view.field edit:self];
}

#pragma mark public

-(void)editdone:(NSString*)newtext
{
    [self.label setTextColor:color];
}

@end