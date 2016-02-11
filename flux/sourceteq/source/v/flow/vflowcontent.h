#import "appdel.h"

@class vflow;

@interface vflowcontent:UIScrollView

+(void)containerin:(vflow*)flow;
-(void)addview:(UIView*)view;

@property(weak, nonatomic)UIView *container;

@end