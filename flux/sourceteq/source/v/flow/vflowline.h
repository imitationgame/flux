#import "appdel.h"

@class mflowlinesitem;

@interface vflowline:UIView

-(instancetype)init:(mflowlinesitem*)model;

@property(weak, nonatomic)mflowlinesitem *model;

@end