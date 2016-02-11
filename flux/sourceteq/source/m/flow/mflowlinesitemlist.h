#import "appdel.h"

@class mflowlinesitem;

@interface mflowlinesitemlist:NSObject

-(NSUInteger)count;
-(mflowlinesitem*)item:(NSUInteger)index;
-(void)add:(mflowlinesitem*)item;

@end