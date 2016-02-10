#import "appdel.h"

@class mflowlinesitem;

@interface mflowlines:NSObject

-(void)add:(mflowlinesitem*)item;
-(NSUInteger)count;
-(mflowlinesitem*)item:(NSUInteger)index;

@end