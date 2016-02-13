#import "vflowline.h"

@implementation vflowline

-(instancetype)init:(mflowlinesitem*)model
{
    self = [super initWithFrame:model.rect];
    [self setClipsToBounds:NO];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    self.model = model;
    
    [self setTintColor:[UIColor colorWithWhite:0.9 alpha:1]];
    
    UIImageView *arrow = [[UIImageView alloc] init];
    [arrow setClipsToBounds:YES];
    [arrow setUserInteractionEnabled:NO];
    [arrow setTranslatesAutoresizingMaskIntoConstraints:NO];
    [arrow setContentMode:UIViewContentModeCenter];
    [arrow setImage:[[UIImage imageNamed:@"arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [arrow setTintColor:self.tintColor];
    
    [self addSubview:arrow];
    
    NSDictionary *views = @{@"arrow":arrow};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-20)-[arrow]-(-20)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[arrow(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.model.linewidth);
    CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
    CGContextMoveToPoint(context, self.model.instarting.x, self.model.instarting.y);
    CGContextAddLineToPoint(context, self.model.inending.x, self.model.inending.y);
    CGContextDrawPath(context, kCGPathStroke);
}

@end