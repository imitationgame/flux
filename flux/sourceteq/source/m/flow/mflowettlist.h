#import "appdel.h"

@class mflow;
@class mflowett;

@interface mflowettlist:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;

@property(weak, nonatomic)mflow *flow;

@end