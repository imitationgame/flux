#import "appdel.h"

@interface cflowdetail:UIViewController

-(instancetype)init:(NSString*)pathpicture saved:(BOOL)saved;

@property(copy, nonatomic)NSString *pathpicture;
@property(nonatomic)BOOL saved;

@end