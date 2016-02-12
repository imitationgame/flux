#import "appdel.h"

@class mflowett;
@class mflowlinesitem;

@interface mflowlinesitemlist:NSObject

-(instancetype)init:(mflowett*)flowett;
-(NSUInteger)count;
-(mflowlinesitem*)item:(NSUInteger)index;
-(void)add:(mflowlinesitem*)item;
-(void)linedown;
-(void)linesparting;
-(void)connectline:(mflowlinesitem*)line topoint:(CGPoint)point;

@property(weak, nonatomic)mflowett *flowett;

@end