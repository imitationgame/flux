#import <Foundation/Foundation.h>
#import "mconfigprotocol.h"

@interface mconfigsection:NSObject

@property(strong, nonatomic)NSArray<id<mconfigprotocol>> *items;
@property(copy, nonatomic)NSString *name;

@end