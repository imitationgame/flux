#import "vflowcontent.h"

#define deltaline 150
#define pointmargin 50

@implementation vflowcontent

+(void)containerin:(vflow*)flow
{
    vflowcontent *content = [[vflowcontent alloc] init];
    flow.contentview = content;
    [flow addSubview:content];
    
    NSDictionary *views = @{@"scroll":content};
    NSDictionary *metrics = @{};
    
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];

    self.width = 100000;
    self.height = 100000;
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:container];
    self.container = container;
    
    return self;
}

-(void)updateConstraints
{
    [super updateConstraints];
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       NSUInteger screenwidth = self.bounds.size.width;
                       NSUInteger deadwidth = self.width - screenwidth;
                       NSUInteger deadwidth_2 = deadwidth / 2;
                       self.marginleft = deadwidth_2;
                       self.marginright = deadwidth_2;
                       self.visibley = self.bounds.size.height;
                       self.centerx = deadwidth_2 + (screenwidth / 2);
                       
                       [self.container setFrame:CGRectMake(-((CGFloat)self.marginleft), 0, self.width, self.height)];
                   });
}

#pragma mark functionality

-(BOOL)validatepoint:(CGPoint)point
{
#warning "here"
    
    BOOL valid = YES;
    NSInteger x = point.x;
    NSInteger y = point.y;
    CGRect rect = CGRectMake(x - pointmargin, y - pointmargin, x + pointmargin, y + pointmargin);
    NSArray *subviews = self.container.subviews;
    
    for(UIView *view in subviews)
    {
        if(CGRectIntersectsRect(rect, view.frame))
        {
            valid = NO;
            
            break;
        }
    }
        
    return valid;
}

#pragma mark public

-(void)addSubview:(UIView*)view
{
    if(self.container)
    {
        [self.container addSubview:view];
    }
    else
    {
        [super addSubview:view];
    }
}

-(CGPoint)linefrom:(CGPoint)point deltax:(NSInteger)deltax deltay:(NSInteger)deltay
{
    CGPoint endingpoint = CGPointMake(point.x, point.y);
    BOOL found = NO;
    
    while(!found)
    {
        endingpoint.x += deltax * deltaline;
        endingpoint.y += deltay * deltaline;
        
        found = [self validatepoint:endingpoint];
    }
    
    return endingpoint;
}

@end