#import "appdel.h"

@class mflowett;
@class vflowtext;

@interface mflowtext:NSObject

-(instancetype)init:(mflowett*)ett;
-(void)editedtext:(NSString*)newtext;
-(void)adjusttext;

@property(weak, nonatomic)mflowett *ett;
@property(weak, nonatomic)vflowtext *view;
@property(copy, nonatomic)NSString *text;

@end