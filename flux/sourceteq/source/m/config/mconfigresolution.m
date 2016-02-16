#import "mconfigresolution.h"

@implementation mconfigresolution

#pragma mark -
#pragma mark config protocol

-(CGFloat)celsize
{
    CGFloat size = 90;
    
    return size;
}

-(void)configcel:(vconfigcel*)cel
{
    vconfigsw *overview = [[vconfigsw alloc] init];
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:16], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
    NSDictionary *attrdescr = @{NSFontAttributeName:[UIFont fontWithName:fontname size:13], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_item_hr", nil) attributes:attrtitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_item_hrdescr", nil) attributes:attrdescr]];
    
    [overview.label setAttributedText:mut];
    [cel changeoverview:overview];
}

@end