#import "appdel.h"
#import "sflowlinesprotocol.h"

@interface sflowlines:NSObject

-(id<sflowlinesprotocol>)item:(NSUInteger)index;

@end