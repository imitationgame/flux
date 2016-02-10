#import "appdel.h"
#import "mflowetttypesprotocol.h"

@interface mflowetttypes:NSObject

-(NSUInteger)count;
-(id<mflowetttypesprotocol>)item:(NSUInteger)index;

@end