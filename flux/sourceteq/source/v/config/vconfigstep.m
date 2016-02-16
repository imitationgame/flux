#import "vconfigstep.h"

@implementation vconfigstep

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    self.label = label;
    
    UILabel *labelcount = [[UILabel alloc] init];
    [labelcount setBackgroundColor:[UIColor clearColor]];
    [labelcount setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelcount setUserInteractionEnabled:NO];
    [labelcount setFont:[UIFont fontWithName:fontname size:20]];
    [labelcount setTextColor:[UIColor colorWithWhite:0 alpha:0.8]];
    [labelcount setTextAlignment:NSTextAlignmentRight];
    self.labelcount = labelcount;
    
    UIStepper *stepper = [[UIStepper alloc] init];
    [stepper setTranslatesAutoresizingMaskIntoConstraints:NO];
    [stepper setTintColor:[UIColor blackColor]];
    self.stepper = stepper;
    
    [self addSubview:label];
    [self addSubview:labelcount];
    [self addSubview:stepper];
    
    NSDictionary *views = @{@"label":label, @"count":labelcount, @"stepper":stepper};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(160)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[count(45)]-10-[stepper]-25-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[count]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[stepper]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end