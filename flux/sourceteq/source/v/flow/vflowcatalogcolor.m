#import "vflowcatalogcolor.h"

@implementation vflowcatalogcolor

+(void)catalogin:(vflowett*)viewett
{
    if(viewett.flowview.catalogcolor)
    {
        [viewett.flowview.catalogcolor loadcolor:viewett.model.color];
        viewett.flowview.catalogcolor.viewett = viewett;
    }
    else
    {
        vflowcatalogcolor *catalogcolor = [[vflowcatalogcolor alloc] init:viewett];
        viewett.flowview.catalogcolor = catalogcolor;
        [viewett.flowview addSubview:catalogcolor];
        
        [catalogcolor show:YES];
        
        NSDictionary *views = @{@"catalog":catalogcolor};
        NSDictionary *metrics = @{};
        
        [viewett.flowview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[catalog]-0-|" options:0 metrics:metrics views:views]];
        [viewett.flowview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[catalog(120)]-0-|" options:0 metrics:metrics views:views]];
    }
}

-(instancetype)init:(vflowett*)viewett
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setAlpha:0];
    
    self.viewett = viewett;
    self.model = viewett.flowview.model.colors;
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setUserInteractionEnabled:NO];
    
    vblur *blur = [vblur light:NO];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setHeaderReferenceSize:CGSizeZero];
    [layout setFooterReferenceSize:CGSizeZero];
    [layout setItemSize:CGSizeMake(80, 80)];
    [layout setMinimumInteritemSpacing:0];
    [layout setMinimumLineSpacing:5];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [layout setSectionInset:UIEdgeInsetsMake(0, 40, 0, 40)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setClipsToBounds:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vflowcatalogcolorcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    UIButton *buttoncancel = [[UIButton alloc] init];
    [buttoncancel setBackgroundColor:[UIColor clearColor]];
    [buttoncancel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttoncancel.titleLabel setFont:[UIFont fontWithName:fontname size:14]];
    [buttoncancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttoncancel setTitleColor:[UIColor colorWithWhite:0 alpha:0.1] forState:UIControlStateHighlighted];
    [buttoncancel setTitle:NSLocalizedString(@"flow_colors_accept", nil) forState:UIControlStateNormal];
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
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(100)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button(40)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionclose:(UIButton*)button
{
    [self.viewett.flowview clearcolor];
}

-(void)loadcolor:(id<mflowcolorsprotocol>)current
{
    NSUInteger selected = 0;
    NSUInteger count = [self.model count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        id<mflowcolorsprotocol> item = [self.model item:i];
        
        if(item == current)
        {
            selected = i;
            
            break;
        }
    }
    
    [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:selected inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
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
         if(show)
         {
             [self loadcolor:self.viewett.model.color];
         }
         else
         {
             [self removeFromSuperview];
         }
     }];
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.model count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vflowcatalogcolorcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    id<mflowcolorsprotocol> color = [self.model item:index.item];
    [self.viewett.model changecolor:color];
}

@end