#import "appdel.h"
#import "mconfigfontsprotocol.h"

@interface vconfigfontscel:UICollectionViewCell

-(void)config:(id<mconfigfontsprotocol>)model;

@property(weak, nonatomic)UILabel *label;

@end