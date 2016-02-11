#import <UIKit/UIKit.h>

@class mflow;
@class mflowett;
@class mflowlinesitem;

@protocol mflowetttypesprotocol <NSObject>

-(NSString*)labeltext;
-(NSString*)imagename;
-(mflowett*)modelett:(mflow*)flow;

@end