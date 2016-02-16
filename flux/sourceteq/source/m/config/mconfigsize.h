#import "appdel.h"
#import "mconfigprotocol.h"

@class vconfigstep;

@interface mconfigsize:NSObject<mconfigprotocol>

@property(weak, nonatomic)vconfigstep *step;

@end