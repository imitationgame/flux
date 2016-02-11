#import "appdel.h"
#import "viewbase.h"

@class mflow;
@class vflowcatalogett;
@class vflowcontent;

@interface vflow:viewbase

-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type;
-(void)actionpoint:(vflowpoint*)point;

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)vflowcontent *contentview;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end