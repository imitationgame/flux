#import "appdel.h"

@class vflow;
@class vflowline;
@class mflowett;
@class mflowlinesitem;
@class mflowlinesitemlist;

@interface mflowlinesitem:NSObject

-(instancetype)init:(CGPoint)starting ending:(CGPoint)ending;
-(vflowline*)generateview;

@property(weak, nonatomic)vflowline *view;
@property(weak, nonatomic)mflowett *startingett;
@property(weak, nonatomic)mflowett *endingett;
@property(weak, nonatomic)mflowlinesitem *nextline;
@property(weak, nonatomic)mflowlinesitemlist *list;
@property(nonatomic)CGPoint starting;
@property(nonatomic)CGPoint ending;
@property(nonatomic)CGPoint instarting;
@property(nonatomic)CGPoint inending;
@property(nonatomic)CGRect rect;
@property(nonatomic)NSUInteger linewidth;

@end