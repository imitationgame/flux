#import <UIKit/UIKit.h>

@class mflowpointsitem;
@class vflowett;
@class mflowlinesitemlist;

@interface mflowett:NSObject

-(void)atpoint:(mflowpointsitem*)point;
-(vflowett*)generateview;
-(vflowett*)flowett;

@property(weak, nonatomic)vflowett *view;
@property(strong, nonatomic)mflowlinesitemlist *linesitemlist;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end