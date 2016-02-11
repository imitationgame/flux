#import "appdel.h"

@class mflow;
@class mflowett;

@interface mflowettlist:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;
-(void)add:(mflowett*)item;

@property(weak, nonatomic)mflow *flow;

@end