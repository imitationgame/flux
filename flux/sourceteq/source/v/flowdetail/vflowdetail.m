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
//    [self addSubview:image];
    
    [controller.snapshot setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:controller.snapshot];
    
    NSDictionary *views = @{@"image":controller.snapshot};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end