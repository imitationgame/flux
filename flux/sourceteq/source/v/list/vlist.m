#import "vlist.h"

@implementation vlist

-(instancetype)init:(clist*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
    
    self.model = [[mlist alloc] init];
    vlistflow *flow = [[vlistflow alloc] init:self.model];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setAlwaysBounceVertical:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vlistcel class] forCellWithReuseIdentifier:celid];
    [collection registerClass:[vlistheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    self.collection = collection;
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedflowsreload:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.collection reloadData];
                   });
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size;
    
    if(self.model.items.count)
    {
        size = CGSizeZero;
    }
    else
    {
        size = CGSizeMake(col.bounds.size.width, 200);
    }
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat width = (col.bounds.size.width - 6) / 2.0;
    CGSize size = CGSizeMake(width, width);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vlistheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mlistitem *model = self.model.items[index.item];
    vlistcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:model];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mlistitem *model = self.model.items[index.item];
    NSString *original = [flowsfolder stringByAppendingPathComponent:model.path];
    NSString *filename = NSLocalizedString(@"flow_exportname", nil);
    NSString *filepath = [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
    
    [mdirs copyfilefrom:original to:filepath];
    [self.controller.navigationController pushViewController:[[cflowdetail alloc] init:filepath saved:YES] animated:YES];
}

@end