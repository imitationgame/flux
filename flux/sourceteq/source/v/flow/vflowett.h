#import <UIKit/UIKit.h>

@class mflowett;

@interface vflowett:UIButton

-(instancetype)init:(mflowett*)model;

@property(weak, nonatomic)mflowett *model;

@end