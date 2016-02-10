#import "appdel.h"
#import "viewbase.h"

@class mflow;
@class vflowcatalogett;

@interface vflow:viewbase

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type;

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)UIScrollView *scroll;
@property(weak, nonatomic)UIView *container;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end