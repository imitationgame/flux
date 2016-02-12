#import "appdel.h"

@class vflow;
@class vflowline;
@class mflowett;
@class mflowlinesitem;
@class mflowlinesitemlist;

@interface mflowlinesitem:NSObject

-(instancetype)init:(mflowlinesitemlist*)list starting:(CGPoint)starting ending:(CGPoint)ending;
-(vflowline*)generateview;
-(void)connecttopoint:(CGPoint)point;

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