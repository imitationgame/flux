#import "appdel.h"

@class mflow;
@class mflowpointsitem;
@class mflowlinesitem;

@interface mflowpoints:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowpointsitem*)item:(NSUInteger)index;
-(void)add:(mflowpointsitem*)item;
-(void)remove:(mflowpointsitem*)item;
-(void)selectpoint:(mflowpointsitem*)point;
-(void)unselect;
-(void)pointat:(NSUInteger)x y:(NSUInteger)y;
-(void)pointatline:(mflowlinesitem*)line;

@property(weak, nonatomic)mflow *flow;
@property(weak, nonatomic)mflowpointsitem *selected;

@end