#import "appdel.h"

@class mflowlinesitem;

@interface mflowlinesitemlist:NSObject

-(NSUInteger)count;
-(mflowlinesitem*)item;
-(void)add:(mflowlinesitem*)item;

@end