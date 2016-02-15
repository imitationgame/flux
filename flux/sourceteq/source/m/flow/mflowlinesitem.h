#import "appdel.h"

@class vflow;
@class vflowline;
@class mflowett;
@class mflowlinesitem;
@class mflowlinesitemlist;
@class mflowpointsitem;

@interface mflowlinesitem:NSObject

-(instancetype)init:(mflowlinesitemlist*)list starting:(CGPoint)starting ending:(CGPoint)ending showinit:(BOOL)showinit;
-(vflowline*)generateview;
-(void)connecttopoint:(CGPoint)point;
-(void)remove;

@property(weak, nonatomic)vflowline *view;
@property(weak, nonatomic)mflowett *startingett;
@property(weak, nonatomic)mflowett *endingett;
@property(weak, nonatomic)mflowlinesitem *nextline;
@property(weak, nonatomic)mflowlinesitem *prevline;
@property(weak, nonatomic)mflowlinesitemlist *list;
@property(weak, nonatomic)mflowpointsitem *pointitem;
@property(nonatomic)CGPoint starting;
@property(nonatomic)CGPoint ending;
@property(nonatomic)CGPoint midpoint;
@property(nonatomic)CGPoint instarting;
@property(nonatomic)CGPoint inending;
@property(nonatomic)CGRect rect;
@property(nonatomic)NSUInteger linewidth;
@property(nonatomic)BOOL showinit;

@end