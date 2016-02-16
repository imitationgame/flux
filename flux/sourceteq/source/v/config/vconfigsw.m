#import "vconfigsw.h"

@implementation vconfigsw

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    UISwitch *sw = [[UISwitch alloc] init];
    [sw setTranslatesAutoresizingMaskIntoConstraints:NO];
    [sw setTintColor:colormain];
    self.sw = sw;
    
    [self addSubview:label];
    [self addSubview:sw];
    
    NSDictionary *views = @{@"label":label, @"switch":sw};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(220)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[switch]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[switch]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end