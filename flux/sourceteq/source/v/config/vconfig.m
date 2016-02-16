#import "vconfig.h"

@implementation vconfig

-(instancetype)init:(cconfig*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(2, 0, 10, 0)];
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
    
    self.collection = collection;
    
    return self;
}

@end