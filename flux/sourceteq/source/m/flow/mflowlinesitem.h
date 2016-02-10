#import "appdel.h"

@class vflowline;

@interface mflowlinesitem:NSObject

-(instancetype)init:(CGPoint)starting ending:(CGPoint)ending;
-(vflowline*)generateview;

@property(weak, nonatomic)vflowline *view;
@property(nonatomic)CGPoint starting;
@property(nonatomic)CGPoint ending;
@property(nonatomic)NSUInteger width;
@property(nonatomic)NSUInteger height;
@property(nonatomic)NSUInteger x;
@property(nonatomic)NSUInteger y;

@end