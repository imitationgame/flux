#import "appdel.h"

@interface mlistitem:NSObject

-(instancetype)init:(NSString*)path;

@property(copy, nonatomic)NSString *path;

@end