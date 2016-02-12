#import "appdel.h"

@class vflow;

@interface vflowstopchoosing:UIView

+(void)stopchoosing:(vflow*)flow;

@property(weak, nonatomic)vflow *flow;

@end