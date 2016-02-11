#import "vflowcatalogcolor.h"

@implementation vflowcatalogcolor

+(void)catalogin:(vflow*)flow
{
    if(!flow.catalogett)
    {
        vflowcatalogcolor *catalogcolor = [[vflowcatalogcolor alloc] init:flow];
        flow.catalogcolor = catalogcolor;
        [flow addSubview:catalogcolor];
        
        [catalogcolor show:YES];
        
        NSDictionary *views = @{@"catalog":catalogcolor};
        NSDictionary *metrics = @{};
        
        [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[catalog]-0-|" options:0 metrics:metrics views:views]];
        [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[catalog(120)]-0-|" options:0 metrics:metrics views:views]];
    }
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.flow = flow;
    self.model = [[mflowetttypes alloc] init];
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setUserInteractionEnabled:NO];
    
    vblur *blur = [vblur light:NO];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setHeaderReferenceSize:CGSizeZero];
    [layout setFooterReferenceSize:CGSizeZero];
    [layout setMinimumInteritemSpacing:0];
    [layout setMinimumLineSpacing:5];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [layout setSectionInset:UIEdgeInsetsMake(0, 5, 0, 5)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setClipsToBounds:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vflowcatalogettcel class] forCellWithReuseIdentifier:celid];
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:[UIColor clearColor]];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontname size:16]];
    [buttoncancel setTitleColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:1] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithRed:1 green:0.1 blue:0 alpha:0.2] forState:UIControlStateHighlighted];
    [buttoncancel setTitle:NSLocalizedString(@"flow_catalog_cancel", nil) forState:UIControlStateNormal];
    [buttoncancel addTarget:self action:@selector(actionclose:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:collection];
    [self addSubview:buttoncancel];
    
    NSDictionary *views = @{@"col":collection, @"blur":blur, @"border":border, @"button":buttoncancel};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(150)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionclose:(UIButton*)button
{
    [self show:NO];
}

#pragma mark public

-(void)show:(BOOL)show
{
    CGFloat alpha = 0;
    
    if(show)
    {
        alpha = 1;
    }
    
    [UIView animateWithDuration:0.4 animations:
     ^
     {
         [self setAlpha:alpha];
     } completion:
     ^(BOOL done)
     {
         if(!show)
         {
             [self removeFromSuperview];
         }
     }];
}

@end