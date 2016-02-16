#import "vconfigfonts.h"

@implementation vconfigfonts

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.model = [[mconfigfonts alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:17]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setText:NSLocalizedString(@"font_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:10];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsMake(0, 20, 0, 20)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceHorizontal:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vconfigfontscel class] forCellWithReuseIdentifier:celid];
    
    [self addSubview:label];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]-0-[col(50)]-0-|" options:0 metrics:metrics views:views]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC), dispatch_get_main_queue(),
                   ^
                   {
                       [self selectcurrent:collection];
                   });
    
    return self;
}

#pragma mark functionality

-(void)selectcurrent:(UICollectionView*)collection
{
    NSUInteger currentsel = 0;
    NSUInteger count = [self.model count];
    NSString *fontcurrent = [msettings singleton].fontselected;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        id<mconfigfontsprotocol> item = [self.model item:i];
        NSString *fontraw = [item fontraw];
        
        if([fontraw isEqualToString:fontcurrent])
        {
            currentsel = i;
            
            break;
        }
    }
    
    [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:currentsel inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(170, col.bounds.size.height);
    
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
    vconfigfontscel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [msettings singleton].fontselected = [[self.model item:index.item] fontraw];
    [[msettings singleton] save];
}

@end