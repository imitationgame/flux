#import "appdel.h"

@class vflow;
@class mflowetttypes;

@interface vflowcatalogett:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(vflow*)flow;
-(void)show:(BOOL)show;

@property(strong, nonatomic)mflowetttypes *model;
@property(weak, nonatomic)vflow *flow;

@end