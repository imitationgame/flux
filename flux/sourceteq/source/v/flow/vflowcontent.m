#import "vflowcontent.h"

#define deltaline 150
#define pointmargin 50

@implementation vflowcontent

+(void)containerin:(vflow*)flow
{
    vflowcontent *content = [[vflowcontent alloc] init];
    flow.contentview = content;
    
    NSDictionary *views = @{@"scroll":self};
    NSDictionary *metrics = @{};
    
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
}

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    
    UIView *container = [[UIView alloc] init];
    [container setClipsToBounds:YES];
    [container setBackgroundColor:[UIColor whiteColor]];
    self.container = container;
    
    [self addSubview:container];
    
    return self;
}

#pragma mark functionality

-(BOOL)validatepoint:(CGPoint)point
{
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
    [self.container addSubview:view];
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