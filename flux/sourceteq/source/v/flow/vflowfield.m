#import "vflowfield.h"

@implementation vflowfield

+(void)fieldin:(vflow*)flow
{
    vflowfield *field = [[vflowfield alloc] init:flow];
    flow.field = field;
    [flow addSubview:field];
    
    NSDictionary *views = @{@"field":field};
    NSDictionary *metrics = @{};
    
    field.constraint = [NSLayoutConstraint constraintWithItem:field attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:flow attribute:NSLayoutAttributeBottom multiplier:1 constant:90];
    
    [flow addConstraint:field.constraint];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[field]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[field(90)]" options:0 metrics:metrics views:views]];
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.flow = flow;
    vblur *blur = [vblur light:YES];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont fontWithName:fontname size:15]];
    [button setTitle:NSLocalizedString(@"flow_field_done", nil) forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actiondone:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setDelegate:self];
    [field setFont:[UIFont fontWithName:fontname size:20]];
    [field setKeyboardType:UIKeyboardTypeAlphabet];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setPlaceholder:NSLocalizedString(@"flow_field_placeholder", nil)];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.field = field;
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:button];
    [self addSubview:field];
    
    NSDictionary *views = @{@"blur":blur, @"border":border, @"button":button, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(100)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button(40)]-0-[field]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[field]-5-|" options:0 metrics:metrics views:views]];
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedkeyboardchange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGFloat ypos;
    
    if(self.field.isFirstResponder)
    {
        CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat origin = keyrect.origin.y;
        ypos = -([UIScreen mainScreen].bounds.size.height - origin);
    }
    else
    {
        ypos = 90;
    }
    
    self.constraint.constant = ypos;
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self layoutIfNeeded];
     }];
}

#pragma mark actions

-(void)actiondone:(UIButton*)button
{
    [self.field resignFirstResponder];
}

#pragma mark functionality

-(void)changetext
{
    
}

#pragma mark public

-(void)edit:(vflowtext*)flowtext
{
    self.flowtext = flowtext;
    
    [self.field becomeFirstResponder];
}

#pragma mark -
#pragma mark field del

-(void)textFieldDidEndEditing:(UITextField*)field
{
    [self changetext];
}

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end