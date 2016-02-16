#import "vlistheader.h"

@implementation vlistheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:20]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setNumberOfLines:0];
    [label setText:NSLocalizedString(@"list_header_empty", nil)];
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:colormain];
    [button.layer setCornerRadius:4];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:16]];
    [button setTitle:NSLocalizedString(@"list_header_button", nil) forState:UIControlStateNormal];
    
    [self addSubview:button];
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[button]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[label]-20-[button(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end