#import "appdel.h"

@class mlist;

@interface vlistflow:UICollectionViewFlowLayout

-(instancetype)init:(mlist*)model;

@property(weak, nonatomic)mlist *model;

@end