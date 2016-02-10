#import "appdel.h"
#import "viewbase.h"

@class mflow;
@class vflowcatalogett;

@interface vflow:viewbase

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type;
-(CGPoint)pointlinedown:(CGPoint)point;
-(CGPoint)pointlineleft:(CGPoint)point;
-(CGPoint)pointlineright:(CGPoint)point;

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)UIScrollView *scroll;
@property(weak, nonatomic)UIView *container;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;
@property(nonatomic)NSUInteger deltaline;

@end