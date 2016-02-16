#import "mlist.h"

@implementation mlist
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    [self reload];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark public

-(void)reload
{
    array = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSString *query = @"SELECT id, created, path FROM flows ORDER BY created ASC;";
                       NSArray *rawflows = [db rows:query];
                       NSUInteger count = rawflows.count;
                       
                       for(NSUInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawflow = rawflows[i];
                           NSString *rawpath = rawflow[@"path"];
                           mlistitem *item = [[mlistitem alloc] init];
                       }
                   });
}

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mlistitem*)item:(NSUInteger)index
{
    mlistitem *item = array[index];
    
    return item;
}

@end