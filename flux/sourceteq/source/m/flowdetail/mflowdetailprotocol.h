#import <Foundation/Foundation.h>

@class cflowdetail;

@protocol mflowdetailprotocol <NSObject>

-(NSString*)title;
-(void)action:(cflowdetail*)controller;

@end