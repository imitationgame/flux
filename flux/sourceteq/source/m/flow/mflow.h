#import "appdel.h"
#import "mflowetttypesprotocol.h"

@class mflowett;
@class mflowpoints;
@class mflowpointsitem;
@class mflowlines;
@class mflowlinesitem;
@class vflowett;

@interface mflow:NSObject

-(NSUInteger)count;
-(mflowett*)item:(NSUInteger)index;
-(vflowett*)add:(id<mflowetttypesprotocol>)type point:(mflowpointsitem*)point;

@property(strong, nonatomic)mflowpoints *points;
@property(strong, nonatomic)mflowlines *lines;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end