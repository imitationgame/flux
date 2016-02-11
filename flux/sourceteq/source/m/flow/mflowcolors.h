#import "appdel.h"
#import "mflowcolorsprotocol.h"

@interface mflowcolors:NSObject

-(NSUInteger)count;
-(id<mflowcolorsprotocol>)item:(NSUInteger)index;

@end