#import "appdel.h"

@class mflowdetail;

@interface vflowdetailmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mflowdetail *model;
@property(weak, nonatomic)UICollectionView *collection;

@end