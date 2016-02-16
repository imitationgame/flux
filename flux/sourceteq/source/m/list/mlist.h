#import "appdel.h"

@class mlistitem;

@interface mlist:NSObject

-(void)reload;
-(NSUInteger)count;
-(mlistitem*)item:(NSUInteger)index;

@end