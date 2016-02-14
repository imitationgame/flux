#import "appdel.h"

@class vflow;

@interface vflowfield:UIView<UITextFieldDelegate>

+(void)fieldin:(vflow*)flow;

@property(weak, nonatomic)vflow *flow;
@property(weak, nonatomic)NSLayoutConstraint *constraint;
@property(weak, nonatomic)UITextField *field;

@end