#import "appdel.h"
#import "mflowcolorsprotocol.h"

@interface mflowcolors:NSObject

-(id<mflowcolorsprotocol>)defaultcolor;
-(NSUInteger)count;
-(id<mflowcolorsprotocol>)item:(NSUInteger)index;

@end