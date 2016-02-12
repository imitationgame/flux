#import "appdel.h"
#import "viewbase.h"

@class mflow;
@class vflowcatalogett;
@class vflowcatalogcolor;
@class vflowcontent;
@class vflowpoint;
@class vflowett;
@class vflowstopchoosing;

@interface vflow:viewbase

-(void)actionpoint:(vflowpoint*)point;
-(void)actionett:(vflowett*)ett;
-(void)show;
-(void)addpointatx:(NSUInteger)x y:(NSUInteger)y;
-(void)catalogtypeselected:(id<mflowetttypesprotocol>)type;
-(void)choosingmode:(BOOL)mode;

@property(strong, nonatomic)mflow *model;
@property(weak, nonatomic)vflowcatalogett *catalogett;
@property(weak, nonatomic)vflowcatalogcolor *catalogcolor;
@property(weak, nonatomic)vflowcontent *contentview;
@property(weak, nonatomic)vflowstopchoosing *stopchoosing;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;
@property(nonatomic)BOOL choosing;

@end