#import "appdel.h"
#import "sflowlinesprotocol.h"

@interface sflowlines:NSObject

+(instancetype)linesleft;
+(instancetype)linesright;
+(instancetype)linesrandom;
-(NSUInteger)count;
-(id<sflowlinesprotocol>)item:(NSUInteger)index;

@property(strong, nonatomic)NSArray *array;

@end