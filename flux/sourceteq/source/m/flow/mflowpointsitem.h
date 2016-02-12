#import "appdel.h"

@class vflow;
@class vflowpoint;
@class mflowlinesitem;

@interface mflowpointsitem:NSObject

-(instancetype)init:(NSUInteger)x y:(NSUInteger)y;
-(vflowpoint*)generateview;

@property(weak, nonatomic)vflowpoint *view;
@property(weak, nonatomic)mflowlinesitem *line;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end