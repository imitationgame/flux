#import "appdel.h"

@class mflowtext;

@interface vflowtext:UIView

-(instancetype)init:(mflowtext*)model;
-(void)editstart;
-(void)editdone:(NSString*)newtext;

@property(weak, nonatomic)mflowtext *model;
@property(weak, nonatomic)UILabel *label;

@end