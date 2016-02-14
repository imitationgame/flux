#import "mflowtext.h"

#define textmargin 10

@implementation mflowtext

-(instancetype)init:(mflowett*)ett
{
    self = [super init];
    self.ett = ett;
    self.text = [ett initialtext];
    
    vflowtext *view = [[vflowtext alloc] init:self];
    self.view = view;
    [ett.flow.view.contentview addSubview:view];
    [self adjusttext];
    
    return self;
}

#pragma mark public

-(void)adjusttext
{
    CGSize textsize = [self.text boundingRectWithSize:CGSizeMake(200, 100) options:stringdrawing attributes:@{NSFontAttributeName:self.view.label.font} context:nil].size;
    NSUInteger textwidth = ceilf(textsize.width) + textmargin;
    NSUInteger textheight = ceilf(textsize.height) + textmargin;
    NSUInteger textwidth_2 = ceilf(textwidth / 2.0);
    NSUInteger textheight_2 = ceilf(textheight / 2.0);
    NSInteger deltax = [self.ett textdeltax];
    NSInteger deltay = [self.ett textdeltay];
    CGPoint pointview = self.ett.view.center;
    CGRect rectview = self.ett.view.frame;
    CGRect recttext = CGRectMake(0, 0, textwidth, textheight);
    
    switch(deltax)
    {
        case -1:
            
            recttext.origin.x = rectview.origin.x - textwidth;
            
            break;
            
        case 0:
            
            recttext.origin.x = pointview.x - textwidth_2;
            
            break;
            
        case 1:
            
            recttext.origin.x = rectview.origin.x + rectview.size.width;
            
            break;
    }
    
    switch(deltay)
    {
        case -1:
            
            recttext.origin.y = rectview.origin.y - textheight;
            
            break;
            
        case 0:
            
            recttext.origin.y = pointview.y - textheight_2;
            
            break;
            
        case 1:
            
            recttext.origin.y = rectview.origin.y + rectview.size.height;
            
            break;
    }
    
    [self.view setFrame:recttext];
}

@end