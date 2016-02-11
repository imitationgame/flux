#import "vflowcatalogett.h"

@implementation vflowcatalogett

+(void)catalogin:(vflow*)flow
{
    if(!flow.catalogett)
    {
        vflowcatalogett *catalogett = [[vflowcatalogett alloc] init:flow];
        flow.catalogett = catalogett;
        [flow addSubview:catalogett];
        
        [catalogett show:YES];
        
        NSDictionary *views = @{@"catalog":catalogett};
        NSDictionary *metrics = @{};
        
        [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[catalog]-0-|" options:0 metrics:metrics views:views]];
        [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[catalog(150)]-0-|" options:0 metrics:metrics views:views]];
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
    [border setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.2]];
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
    
    [self addSubview:blur];
    [self addSubview:border];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"blur":blur, @"border":border};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[blur]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[border(1)]" options:0 metrics:metrics views:views]];
    
    return self;
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

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(140, col.bounds.size.height);
    
    return size;
}

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
    vflowcatalogettcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [self.flow catalogtypeselected:[self.model item:index.item]];
}

@end