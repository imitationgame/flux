#import "appdel.h"

@class mflowett;

@interface mflow:NSObject

-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;

@property(strong, nonatomic)mflowpoints *points;

@end