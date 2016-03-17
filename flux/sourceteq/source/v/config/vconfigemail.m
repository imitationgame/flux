#import "vconfigemail.h"

static NSString* const mailurl = @"mailto:flux@iturbi.de";

@implementation vconfigemail

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:18], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSDictionary *dictsubtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:14], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_email_title", nil) attributes:dicttitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_email_subtitle", nil) attributes:dictsubtitle];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrsubtitle];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:colormain];
    [button.layer setCornerRadius:4];
    [button setTitle:NSLocalizedString(@"config_email_button", nil) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:14]];
    [button addTarget:self action:@selector(actionwrite:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    
    [self addSubview:label];
    [self addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label(90)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(120)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(40)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionwrite:(UIButton*)button
{
    [[analytics singleton] trackevent:ga_event_email action:ga_action_start label:nil];
    
    NSURL *url = [NSURL URLWithString:mailurl];
    [[UIApplication sharedApplication] openURL:url];
}

@end