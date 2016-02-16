#import "vlistcel.h"

@implementation vlistcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.image = image;
    
    UIView *selector = [[UIView alloc] init];
    [selector setBackgroundColor:colormain];
    [selector setTranslatesAutoresizingMaskIntoConstraints:NO];
    [selector setUserInteractionEnabled:NO];
    self.selector = selector;
    
    [self addSubview:image];
    [self addSubview:selector];
    
    NSDictionary *views = @{@"image":image, @"selector":selector};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[selector]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[selector(10)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self.image setAlpha:0.2];
        [self.selector setHidden:NO];
    }
    else
    {
        [self.image setAlpha:1];
        [self.selector setHidden:YES];
    }
}

#pragma mark public

-(void)config:(mlistitem*)item
{
    [self.image setImage:nil];
    [self hover];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       UIImage *img = [UIImage imageWithContentsOfFile:[flowsfolder stringByAppendingPathComponent:item.path]];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [self.image setImage:img];
                                      });
                   });
}

@end