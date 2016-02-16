#import "vflowdetail.h"

@implementation vflowdetail

-(instancetype)init:(cflowdetail*)controller
{
    self = [super init:controller];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image setImage:[UIImage imageWithContentsOfFile:controller.pathpicture]];
    
    vflowdetailmenu *menu = [[vflowdetailmenu alloc] init];
    self.menu = menu;
    
    [self addSubview:image];
    [self addSubview:menu];
    
    NSDictionary *views = @{@"image":image, @"menu":menu};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[menu]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-[menu(50)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end