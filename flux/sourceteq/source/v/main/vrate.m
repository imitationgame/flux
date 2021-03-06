#import "vrate.h"

@implementation vrate

-(instancetype)init:(crate*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    vblur *blur = [vblur light:YES];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontname size:18]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:NSLocalizedString(@"rate_descr", nil)];
    [label setTextColor:[UIColor blackColor]];
    [label setNumberOfLines:0];
    self.label = label;
    
    vratemenu *menu = [[vratemenu alloc] init:self];
    self.menu = menu;
    [self addSubview:blur];
    [self addSubview:label];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"blur":blur, @"label":label, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[label]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-150-[label]-10-[menu(120)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)rateselected
{
    [self.menu setUserInteractionEnabled:NO];
    [valert alert:NSLocalizedString(@"rate_thanks", nil) inview:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), dispatch_get_main_queue(),
                   ^
                   {
                       [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
                   });
}

@end