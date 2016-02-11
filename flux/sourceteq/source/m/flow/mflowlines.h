#import "appdel.h"

@class mflow;
@class mflowlinesitem;

@interface mflowlines:NSObject

-(instancetype)init:(mflow*)flow;
-(void)add:(mflowlinesitem*)item;
-(NSUInteger)count;
-(mflowlinesitem*)item:(NSUInteger)index;

@property(weak, nonatomic)mflow *flow;

@end