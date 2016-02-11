#import "appdel.h"

@class mflow;
@class mflowpointsitem;

@interface mflowpoints:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowpointsitem*)item:(NSUInteger)index;
-(void)add:(mflowpointsitem*)item;
-(void)remove:(mflowpointsitem*)item;
-(void)selectpoint:(mflowpointsitem*)point;

@property(weak, nonatomic)mflow *flow;
@property(weak, nonatomic)mflowpointsitem *selected;

@end