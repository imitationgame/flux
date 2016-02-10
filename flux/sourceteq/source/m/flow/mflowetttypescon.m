#import "mflowetttypescon.h"

@implementation mflowetttypescon

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = NSLocalizedString(@"flow_catalog_con", nil);
    
    return string;
}

-(void)overview:(vflowcatalogettcel*)cell
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [view setClipsToBounds:YES];
    [view setUserInteractionEnabled:NO];
    [view.layer setCornerRadius:10];
    
    return view;
}

@end