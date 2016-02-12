#import "appdel.h"
#import "sflowlinesprotocol.h"

@interface sflowlines:NSObject

-(NSUInteger)count;
-(id<sflowlinesprotocol>)item:(NSUInteger)index;
-(void)linesleft;
-(void)linesright;
-(void)linesrandomleftright;

@property(strong, nonatomic)NSMutableArray *array;

@end