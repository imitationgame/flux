#import "appdel.h"
#import "sflowlinesprotocol.h"

@interface sflowlines:NSObject

+(void)linesleft;
+(void)linesright;
+(void)linesrandom;
-(NSUInteger)count;
-(id<sflowlinesprotocol>)item:(NSUInteger)index;

@property(strong, nonatomic)NSArray *array;

@end