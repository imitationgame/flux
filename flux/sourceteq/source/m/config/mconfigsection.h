#import "appdel.h"

@interface mconfigsection:NSObject

@property(strong, nonatomic)NSArray<id<mconfigprotocol>> *items;
@property(copy, nonatomic)NSString *name;

@end