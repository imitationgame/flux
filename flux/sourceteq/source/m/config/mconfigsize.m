#import "mconfigsize.h"

@implementation mconfigsize

#pragma mark actions

-(void)actionstepper:(UIStepper*)stepper
{
    NSUInteger value = stepper.value;
    
    [self print:value];
    [msettings singleton].fontsize = value;
    [[msettings singleton] save];
    
    [[analytics singleton] trackevent:ga_event_fontsize action:ga_action_done label:[NSString stringWithFormat:@"%@", @(value)]];
}

#pragma mark functionality

-(void)print:(NSUInteger)value
{
    [self.step.labelcount setText:[[tools singleton] numbertostring:@(value)]];
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
    NSUInteger value = [msettings singleton].fontsize;
    
    vconfigstep *step = [[vconfigstep alloc] init];
    [step.stepper setValue:value];
    [step.stepper addTarget:self action:@selector(actionstepper:) forControlEvents:UIControlEventValueChanged];
    [step.stepper setMinimumValue:10];
    [step.stepper setMaximumValue:35];
    self.step = step;
    [step.label setText:NSLocalizedString(@"config_item_size", nil)];
    [cel changeoverview:step];
    [self print:value];
}

@end