#import "appdel.h"

@interface cmain:UINavigationController

+(instancetype)singleton;

@property(weak, nonatomic)cpages *pages;

@end