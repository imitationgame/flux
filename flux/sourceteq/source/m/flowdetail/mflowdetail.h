#import "appdel.h"
#import "mflowdetailprotocol.h"

@interface mflowdetail:NSObject

-(NSUInteger)count;
-(id<mflowdetailprotocol>)item:(NSUInteger)index;

@end