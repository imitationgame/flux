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
-(void)selectett:(mflowett*)ett;
-(void)deselect;

@property(weak, nonatomic)mflow *flow;
@property(weak, nonatomic)mflowett *selected;

@end