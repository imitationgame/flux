#import "appdel.h"

@class vflow;

@interface vflowcontent:UIScrollView

+(void)containerin:(vflow*)flow;
-(CGPoint)linefrom:(CGPoint)point deltax:(NSInteger)deltax deltay:(NSInteger)deltay;

@property(weak, nonatomic)UIView *container;

@end