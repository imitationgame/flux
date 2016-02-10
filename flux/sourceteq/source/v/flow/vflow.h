#import "appdel.h"

@class mflow;
@class vflowcatalogett;

@interface vflow:UIScrollView

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)UIView *container;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end