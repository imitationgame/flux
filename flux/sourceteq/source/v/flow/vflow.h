#import "appdel.h"
#import "viewbase.h"

@class mflow;
@class vflowcatalogett;
@class vflowcontent;
@class vflowpoint;

@interface vflow:viewbase

-(void)actionpoint:(vflowpoint*)point;
-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y;
-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type;

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)vflowcontent *contentview;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end