#import "appdel.h"

@class vflow;
@class vflowline;
@class mflowett;

@interface mflowlinesitem:NSObject

+(void)lineat:(CGPoint)starting to:(CGPoint)ending flow:(vflow*)flow;

@property(weak, nonatomic)vflowline *view;
@property(weak, nonatomic)mflowett *startingett;
@property(weak, nonatomic)mflowett *endingett;
@property(nonatomic)CGPoint starting;
@property(nonatomic)CGPoint ending;
@property(nonatomic)CGPoint instarting;
@property(nonatomic)CGPoint inending;
@property(nonatomic)CGRect rect;
@property(nonatomic)NSUInteger linewidth;

@end