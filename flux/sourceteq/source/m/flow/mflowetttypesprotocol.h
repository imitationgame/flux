#import <UIKit/UIKit.h>

@class mflow;
@class mflowett;
@class mflowpointsitem;

@protocol mflowetttypesprotocol <NSObject>

-(NSString*)labeltext;
-(NSString*)imagename;
-(mflowett*)modelett:(mflow*)flow atpoint:(mflowpointsitem*)point;

@end