#import "appdel.h"
#import "mflowetttypesprotocol.h"

@class mflow;
@class mflowett;
@class mflowpointsitem;

@interface mflowettlist:NSObject

-(instancetype)init:(mflow*)flow;
-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;
-(void)add:(id<mflowetttypesprotocol>)type point:(mflowpointsitem*)point;

@property(weak, nonatomic)mflow *flow;

@end