#import "vflowtext.h"

@implementation vflowtext

-(instancetype)init:(mflowtext*)model
{
    self = [super init];
    
    self.model = model;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setText:model.text];
    [label setFont:[UIFont fontWithName:fontname size:15]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:[model.ett textalign]];
    self.label = label;
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setBackgroundColor:[UIColor clearColor]];
    
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

@end