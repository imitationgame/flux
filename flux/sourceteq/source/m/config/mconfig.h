#import "appdel.h"

@class mconfigsection;

@interface mconfig:NSObject

@property(strong, nonatomic)NSArray<mconfigsection*> *sections;

@end