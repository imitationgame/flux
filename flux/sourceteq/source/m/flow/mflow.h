#import "appdel.h"
#import "mflowetttypesprotocol.h"

@class mflowettlist;
@class mflowpoints;
@class mflowlines;
@class vflow;

@interface mflow:NSObject

-(instancetype)init:(vflow*)view;
-(void)add:(id<mflowetttypesprotocol>)type;


@property(weak, nonatomic)vflow *view;
@property(strong, nonatomic)mflowettlist *ettlist;
@property(strong, nonatomic)mflowpoints *points;
@property(strong, nonatomic)mflowlines *lines;
@property(strong, nonatomic)mflowcolors *colors;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end