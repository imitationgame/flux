#import "appdel.h"

@class mflowpointsitem;

@interface vflowpoint:UIButton

-(instancetype)init:(mflowpointsitem*)flowpoint;

@property(weak, nonatomic)mflowpointsitem *model;

@end