#import "appdel.h"

@class mconfigsection;

@interface vconfigheader:UICollectionReusableView

-(void)config:(mconfigsection*)section;

@property(weak, nonatomic)UILabel *label;

@end