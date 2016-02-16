#import "appdel.h"

@class mconfigfonts;

@interface vconfigfonts:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mconfigfonts *model;
@property(weak, nonatomic)UICollectionView *collection;

@end