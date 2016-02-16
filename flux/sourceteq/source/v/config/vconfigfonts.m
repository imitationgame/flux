#import "vconfigfonts.h"

@implementation vconfigfonts
{
    CGFloat itemwidth;
    NSUInteger selected;
    BOOL trackscroll;
}

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    trackscroll = NO;
    itemwidth = 160;
    self.model = [[mconfigfonts alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:fontname size:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setText:NSLocalizedString(@"font_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
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
    self.collection = collection;
    
    [self addSubview:label];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(200)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]-20-[col(65)]-0-|" options:0 metrics:metrics views:views]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 300), dispatch_get_main_queue(),
                   ^
                   {
                       [self selectcurrent];
                   });
    
    return self;
}

#pragma mark functionality

-(void)selectcurrent
{
    selected = 0;
    NSUInteger count = [self.model count];
    NSString *fontcurrent = [msettings singleton].fontselected;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        id<mconfigfontsprotocol> item = [self.model item:i];
        NSString *fontraw = [item fontraw];
        
        if([fontraw isEqualToString:fontcurrent])
        {
            selected = i;
            
            break;
        }
    }
    
    [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:selected inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}

-(void)postselect:(NSInteger)index
{
    if(index != selected)
    {
        selected = index;
        [msettings singleton].fontselected = [[self.model item:selected] fontraw];
        [[msettings singleton] save];
    }
}

#pragma mark -
#pragma mark col del

-(void)scrollViewWillBeginDragging:(UIScrollView*)drag
{
    trackscroll = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scroll
{
    trackscroll = NO;
}

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    if(trackscroll)
    {
        CGFloat leftoffset = scroll.contentOffset.x;
        
        CGPoint point = CGPointMake(leftoffset + (scroll.bounds.size.width / 2), 0);
        NSIndexPath *index = [self.collection indexPathForItemAtPoint:point];
        
        if(index)
        {
            [self postselect:index.item];
            [self.collection selectItemAtIndexPath:index animated:NO scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat margin = (col.bounds.size.width - itemwidth) / 2;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(itemwidth, col.bounds.size.height);
    
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
    [col scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self postselect:index.item];
    trackscroll = NO;
}

@end