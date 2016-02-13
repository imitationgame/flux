#import "appdel.h"

@class mflowtext;

@interface vflowtext:UIView

-(instancetype)init:(mflowtext*)model;

@property(weak, nonatomic)mflowtext *model;

@end