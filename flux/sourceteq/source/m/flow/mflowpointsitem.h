#import "appdel.h"

@class vflow;
@class vflowpoint;
@class mflowpoints;
@class mflowlinesitem;

@interface mflowpointsitem:NSObject

-(instancetype)init:(mflowpoints*)points x:(NSUInteger)x y:(NSUInteger)y;
-(vflowpoint*)generateview;
-(void)remove;

@property(weak, nonatomic)mflowpoints *points;
@property(weak, nonatomic)vflowpoint *view;
@property(weak, nonatomic)mflowlinesitem *line;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end