#import "appdel.h"

@class mlistitem;

@interface mlist:NSObject

-(void)reload;

@property(strong, nonatomic)NSMutableArray<mlistitem*> *items;

@end