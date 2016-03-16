#import "appdel.h"

@interface mlistitem:NSObject

-(instancetype)init:(NSString*)path;
-(CGFloat)heightforwidth:(CGFloat)width;

@property(copy, nonatomic)NSString *path;

@end