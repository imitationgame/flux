#import "appdel.h"
#import "mflowdetailprotocol.h"

@interface mflowdetail:NSObject

-(instancetype)init:(BOOL)saved;

@property(strong, nonatomic)NSMutableArray<id<mflowdetailprotocol>> *items;

@end