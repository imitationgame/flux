#import "appdel.h"

@interface vflowdetailmenucel:UICollectionViewCell

-(void)config:(id<mflowdetailprotocol>)model;

@property(weak, nonatomic)UILabel *label;

@end