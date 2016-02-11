#import "appdel.h"

@class vflow;

@interface vflowcontent:UIScrollView

+(void)containerin:(vflow*)flow;

@property(weak, nonatomic)UIView *container;

@end