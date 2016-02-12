#import "appdel.h"
#import "sflowlinesprotocol.h"

@interface sflowlines:NSObject

-(NSUInteger)count;
-(id<sflowlinesprotocol>)item:(NSUInteger)index;
-(void)linesleft;
-(void)linesright;
-(void)linesrandomleftright;
-(void)linesup;
-(void)linesdown;
-(void)linesrandomupdown;

@property(strong, nonatomic)NSMutableArray *array;

@end