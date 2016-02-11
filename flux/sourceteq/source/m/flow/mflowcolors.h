#import "appdel.h"
#import "mflowcolorsprotocol.h"

@class mflow;

@interface mflowcolors:NSObject

-(instancetype)init:(mflow*)flow;
-(id<mflowcolorsprotocol>)defaultcolor;
-(NSUInteger)count;
-(id<mflowcolorsprotocol>)item:(NSUInteger)index;

@property(weak, nonatomic)mflow *flow;

@end