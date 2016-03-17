#import "appdel.h"

static NSUInteger const margincell = 1;
static NSUInteger const marginimage = 2;

@interface vlistcel:UICollectionViewCell

-(void)config:(mlistitem*)item;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UIView *background;

@end