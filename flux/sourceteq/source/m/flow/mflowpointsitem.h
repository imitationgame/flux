#import "appdel.h"

@class vflow;
@class vflowpoint;

@interface mflowpointsitem:NSObject

+(void)pointat:(NSUInteger)x y:(NSUInteger)y flow:(vflow*)flow;

@property(weak, nonatomic)vflowpoint *view;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end