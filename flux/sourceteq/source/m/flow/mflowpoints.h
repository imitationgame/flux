#import "appdel.h"

@class mflowpointsitem;

@interface mflowpoints:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowpointsitem*)item:(NSUInteger)index;
-(void)add:(mflowpointsitem*)item;
-(void)remove:(mflowpointsitem*)item;
-(void)selectpoint:(mflowpointsitem*)point;
-(mflowpointsitem*)selecteditem;

@property(weak, nonatomic)mflowpointsitem *selected;

@end