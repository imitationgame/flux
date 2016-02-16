#import "appdel.h"
#import "viewbase.h"

@class mlist;

@interface vlist:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mlist *model;
@property(weak, nonatomic)UICollectionView *collection;

@end