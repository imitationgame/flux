#import <UIKit/UIKit.h>

@class mflowpointsitem;
@class vflowett;

@interface mflowett:NSObject

-(void)atpoint:(mflowpointsitem*)point;
-(vflowett*)generateview;
-(vflowett*)flowett;

@property(weak, nonatomic)vflowett *view;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end