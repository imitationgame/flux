#import "appdel.h"

@class vflow;

@interface vflowcatalogcolor:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

+(void)catalogin:(vflow*)flow;

@property(weak, nonatomic)vflow *flow;

@end