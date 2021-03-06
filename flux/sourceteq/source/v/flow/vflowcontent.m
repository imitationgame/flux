#import "vflowcontent.h"

#define pointmargin 50
#define pagemargin 100

@implementation vflowcontent
{
    BOOL firsttime;
}

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
    [self setAlwaysBounceHorizontal:YES];
    [self setAlwaysBounceVertical:YES];
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];

    firsttime = NO;
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
                       if(!firsttime)
                       {
                           firsttime = YES;
                           [self firsttimeconstraints];
                           [self.container setFrame:CGRectMake(-((CGFloat)self.marginleft), -((CGFloat)self.margintop), self.width, self.height)];
                       }
                   });
}

#pragma mark functionality

-(void)firsttimeconstraints
{
    NSUInteger screenwidth = self.bounds.size.width;
    NSUInteger deadwidth = self.width - screenwidth;
    NSUInteger deadwidth_2 = deadwidth / 2;
    self.marginleft = deadwidth_2;
    self.marginright = deadwidth_2;
    self.margintop = 150;
    self.visibley = self.bounds.size.height;
    self.centerx = deadwidth_2 + (screenwidth / 2);
}

-(BOOL)validatepoint:(CGPoint)point
{
    BOOL valid = YES;
    NSUInteger x = point.x;
    NSUInteger y = point.y;
    NSUInteger minx = x - pointmargin;
    NSUInteger miny = y - pointmargin;
    CGRect rect = CGRectMake(minx, miny, 2 * pointmargin, 2 * pointmargin);
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

-(void)adjustscreen
{
    NSUInteger pagewidth = self.width - (self.marginright + self.marginleft);
    CGFloat pagewidth_2 = pagewidth / 2.0;
    CGFloat screenmarginleft = -(CGFloat)self.marginleft;
    CGFloat screenmargintop = -(CGFloat)self.margintop;
    CGSize contentsize = CGSizeMake(pagewidth, self.visibley);
    CGRect containerframe = CGRectMake(screenmarginleft, screenmargintop, self.width, self.height);
    CGFloat width = self.bounds.size.width;
    CGFloat width_2 = width / 2.0;
    CGFloat height = self.bounds.size.height;
    CGFloat scrollleft = pagewidth_2 - width_2;
    CGRect rectscroll = CGRectMake(scrollleft, self.contentOffset.y, width, height);
    [self.container setFrame:containerframe];
    [self setContentSize:contentsize];
    [self scrollRectToVisible:rectscroll animated:YES];
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

-(void)checkdimensions
{
    [self firsttimeconstraints];
    NSArray *subviews = self.container.subviews;
    NSUInteger pointpage = pointmargin + pagemargin;
    
    for(UIView *view in subviews)
    {
        if(![view isKindOfClass:[UIImageView class]])
        {
            CGRect frame = view.frame;
            NSUInteger x = frame.origin.x - pointpage;
            NSUInteger y = frame.origin.y - pointmargin;
            NSUInteger w = frame.size.width + frame.origin.x + pointpage;
            NSUInteger h = frame.size.height + frame.origin.y + pointpage;
            
            if(x < self.marginleft)
            {
                self.marginleft = x;
            }
            
            if(w > self.width - self.marginright)
            {
                self.marginright = self.width - w;
            }
            
            if(y < self.margintop)
            {
                NSUInteger addedy = self.margintop - y;
                self.margintop -= addedy;
                self.visibley += addedy;
            }
            
            if(h > self.margintop + self.visibley)
            {
                self.visibley = h - self.margintop;
            }
        }
    }
    
    [self adjustscreen];
}

@end