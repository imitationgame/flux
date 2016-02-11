#import "appdel.h"

@class vflow;

@interface vflowcontent:UIScrollView

+(void)containerin:(vflow*)flow;
-(CGPoint)linefrom:(CGPoint)point deltax:(NSInteger)deltax deltay:(NSInteger)deltay;

@property(weak, nonatomic)UIView *container;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;
@property(nonatomic)NSUInteger marginleft;
@property(nonatomic)NSUInteger marginright;
@property(nonatomic)NSUInteger visibley;
@property(nonatomic)NSUInteger centerx;

@end