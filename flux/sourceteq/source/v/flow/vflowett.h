#import <UIKit/UIKit.h>

@class mflowett;
@class vflow;

@interface vflowett:UIButton

-(instancetype)init:(mflowett*)model imagename:(NSString*)imagename;

@property(weak, nonatomic)mflowett *model;
@property(weak, nonatomic)vflow *flowview;
@property(weak, nonatomic)UIButton *button;

@end