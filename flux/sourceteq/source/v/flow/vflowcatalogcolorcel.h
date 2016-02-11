#import "appdel.h"

@interface vflowcatalogcolorcel:UICollectionViewCell

-(void)config:(id<mflowcolorsprotocol>)model;

@property(weak, nonatomic)UIView *circle;
@property(weak, nonatomic)UIView *outercircle;
@property(weak, nonatomic)UIView *selector;

@end