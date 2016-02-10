#import "appdel.h"

@class vflowpoint;

@interface mflowpointsitem:NSObject

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y;

@property(weak, nonatomic)vflowpoint *view;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end