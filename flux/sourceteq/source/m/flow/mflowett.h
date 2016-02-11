#import <UIKit/UIKit.h>
#import "mflowcolorsprotocol.h"

@class mflow;
@class mflowpointsitem;
@class vflowett;
@class mflowlinesitemlist;

@interface mflowett:NSObject

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point;
-(vflowett*)generateview;

@property(weak, nonatomic)mflow *flow;
@property(weak, nonatomic)vflowett *view;
@property(weak, nonatomic)id<mflowcolorsprotocol> color;
@property(strong, nonatomic)mflowlinesitemlist *linesitemlist;
@property(nonatomic)Class viewclass;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end