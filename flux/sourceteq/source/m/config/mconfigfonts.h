#import "appdel.h"
#import "mconfigfontsprotocol.h"

@interface mconfigfonts:NSObject<mconfigfontsprotocol>

-(NSUInteger)count;
-(id<mconfigfontsprotocol>)item:(NSUInteger)index;

@end