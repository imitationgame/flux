#import "mflowetttypespro.h"

@implementation mflowetttypespro

#pragma mark -
#pragma mark types protocol

-(NSString*)labeltext
{
    NSString *string = ;
    
    return string;
}

-(void)overview:(vflowcatalogettcel*)cell
{
    [cell.label setText:NSLocalizedString(@"flow_catalog_pro", nil)];
    [cell.overview removeFromSuperview];
}

@end