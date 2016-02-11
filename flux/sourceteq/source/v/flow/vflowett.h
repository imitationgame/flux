#import <UIKit/UIKit.h>

@class mflowett;
@class vflow;

@interface vflowett:UIButton

-(instancetype)init:(mflowett*)model;

@property(weak, nonatomic)mflowett *model;
@property(weak, nonatomic)vflow *flowview;

@end