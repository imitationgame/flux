#import "appdel.h"

@interface cflowdetail:UIViewController

//-(instancetype)init:(NSString*)pathpicture;
-(instancetype)init:(UIView*)snapshot;

@property(copy, nonatomic)NSString *pathpicture;
@property(strong, nonatomic)UIView *snapshot;

@end