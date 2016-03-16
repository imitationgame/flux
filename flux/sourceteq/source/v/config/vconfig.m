#import "vconfig.h"

static NSUInteger const headerheight = 60;
static NSUInteger const sectionbottom = 40;

@implementation vconfig

-(instancetype)init:(cconfig*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    self.model = [[mconfig alloc] init];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(2, 0, sectionbottom, 0)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vconfigcel class] forCellWithReuseIdentifier:celid];
    [collection registerClass:[vconfigheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGSize size = CGSizeMake(width, headerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    id<mconfigprotocol> model = self.model.sections[index.section].items[index.item];
    CGFloat width = col.bounds.size.width;
    CGFloat height = [model celsize];
    CGSize size = CGSizeMake(width, height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger count = self.model.sections.count;
    
    return count;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = self.model.sections[section].items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    mconfigsection *model = self.model.sections[index.section];
    vconfigheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
    [header config:model];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    id<mconfigprotocol> model = self.model.sections[index.section].items[index.item];
    vconfigcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [model configcel:cel];
    
    return cel;
}

@end