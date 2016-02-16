#import "appdel.h"

@class cflowdetail;
@class mflowdetail;

@interface vflowdetailmenu:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cflowdetail*)controller;

@property(weak, nonatomic)cflowdetail *controller;
@property(strong, nonatomic)mflowdetail *model;
@property(weak, nonatomic)UICollectionView *collection;

@end