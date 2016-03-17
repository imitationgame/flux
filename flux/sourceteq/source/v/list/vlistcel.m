#import "vlistcel.h"

static NSUInteger const cornerradius = 6;

@implementation vlistcel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    [image setUserInteractionEnabled:NO];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    [image.layer setCornerRadius:cornerradius];
    self.image = image;
    
    UIView *background = [[UIView alloc] init];
    [background setBackgroundColor:colormain];
    [background setTranslatesAutoresizingMaskIntoConstraints:NO];
    [background setUserInteractionEnabled:NO];
    [background.layer setCornerRadius:cornerradius];
    self.background = background;
    
    [background addSubview:image];
    [self addSubview:background];
    
    NSDictionary *views = @{@"image":image, @"background":background};
    NSDictionary *metrics = @{@"margincell":@(margincell), @"marginimage":@(marginimage)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(marginimage)-[image]-(marginimage)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(marginimage)-[image]-(marginimage)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margincell)-[background]-(margincell)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margincell)-[background]-(margincell)-|" options:0 metrics:metrics views:views]];
    
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
        [self.background setBackgroundColor:colormain];
    }
    else
    {
        [self.background setBackgroundColor:[UIColor whiteColor]];
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