#import "appdel.h"
#import "mconfigfontsprotocol.h"

@interface mconfigfonts:NSObject

-(NSUInteger)count;
-(id<mconfigfontsprotocol>)item:(NSUInteger)index;

@end