#import "appdel.h"

@class mflowett;
@class mflowpoints;

@interface mflow:NSObject

-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;
-(vflowett*)add:(id<mflowetttypesprotocol>)type point:(mflowpointsitem*)point;

@property(strong, nonatomic)mflowpoints *points;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end