#import "appdel.h"

@class vflow;
@class mflowcolors;

@interface vflowcatalogcolor:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

+(void)catalogin:(vflowett*)viewett;
-(void)show:(BOOL)show;

@property(weak, nonatomic)vflowett *viewett;
@property(weak, nonatomic)mflowcolors *model;
@property(weak, nonatomic)UICollectionView *collection;

@end