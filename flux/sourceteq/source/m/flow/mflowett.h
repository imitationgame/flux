#import <UIKit/UIKit.h>
#import "mflowcolorsprotocol.h"

@class mflow;
@class mflowpointsitem;
@class mflowlinesitemlist;
@class mflowtext;
@class vflowett;

@interface mflowett:NSObject

-(instancetype)init:(mflow*)flow atpoint:(mflowpointsitem*)point;
-(vflowett*)generateview:(NSString*)imagename;
-(void)selected:(BOOL)selected;
-(void)changecolor:(id<mflowcolorsprotocol>)color;
-(NSString*)initialtext;
-(NSTextAlignment)textalign;

@property(weak, nonatomic)mflow *flow;
@property(weak, nonatomic)id<mflowcolorsprotocol> color;
@property(strong, nonatomic)mflowlinesitemlist *linesitemlist;
@property(strong, nonatomic)mflowtext *text;
@property(weak, nonatomic)vflowett *view;
@property(nonatomic)Class viewclass;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;

@end