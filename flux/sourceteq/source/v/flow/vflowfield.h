#import "appdel.h"

@class vflow;

@interface vflowfield:UIView

-(instancetype)init:(vflow*)flow;

@property(weak, nonatomic)vflow *flow;
@property(weak, nonatomic)UITextField *field;

@end