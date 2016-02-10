#import "appdel.h"

@class mflowlinesitem;

@interface mflowlines:NSObject

-(NSUInteger)count;
-(mflowlinesitem*)item:(NSUInteger)index;

@end