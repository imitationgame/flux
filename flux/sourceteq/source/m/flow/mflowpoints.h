#import "appdel.h"

@class mflowpointsitem;

@interface mflowpoints:NSObject

-(NSUInteger)count;
-(mflowpointsitem*)item:(NSUInteger)index;
-(void)add:(mflowpointsitem*)item;

@end