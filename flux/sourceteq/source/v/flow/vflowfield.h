#import "appdel.h"

@class vflow;
@class vflowtext;

@interface vflowfield:UIView<UITextFieldDelegate>

+(void)fieldin:(vflow*)flow;
-(void)edit:(vflowtext*)flowtext;

@property(weak, nonatomic)vflow *flow;
@property(weak, nonatomic)vflowtext *flowtext;
@property(weak, nonatomic)NSLayoutConstraint *constraint;
@property(weak, nonatomic)UITextField *field;

@end