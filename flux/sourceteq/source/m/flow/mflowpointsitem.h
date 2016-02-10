#import "appdel.h"

@class vflowpoint;

@interface mflowpointsitem:NSObject

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y;
-(vflowpoint*)generateview;

@property(strong, nonatomic)vflowpoint *view;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end