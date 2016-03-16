#import "appdel.h"

@interface vlistcel:UICollectionViewCell

-(void)config:(mlistitem*)item;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *background;

@end