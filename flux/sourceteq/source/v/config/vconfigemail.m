#import "vconfigemail.h"

@implementation vconfigemail

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:18], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.5]};
    NSDictionary *dictsubtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:16], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_email_title", nil) attributes:dicttitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_email_subtitle", nil) attributes:dictsubtitle];
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrsubtitle];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end