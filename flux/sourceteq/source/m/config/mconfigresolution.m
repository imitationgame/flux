#import "mconfigresolution.h"

@implementation mconfigresolution

-(void)actionchanged:(UISwitch*)sw
{
    [msettings singleton].highresolution = sw.isOn;
    [[msettings singleton] save];
}

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
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
    NSDictionary *attrdescr = @{NSFontAttributeName:[UIFont fontWithName:fontname size:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_item_hr", nil) attributes:attrtitle]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"config_item_hrdescr", nil) attributes:attrdescr]];
    
    [overview.label setAttributedText:mut];
    [overview.sw setOn:[msettings singleton].highresolution animated:NO];
    [overview.sw addTarget:self action:@selector(actionchanged:) forControlEvents:UIControlEventValueChanged];
    
    [cel changeoverview:overview];
}

@end