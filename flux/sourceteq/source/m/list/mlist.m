#import "mlist.h"

@implementation mlist
{
    NSMutableArray *array;
}

-(instancetype)init
{
    self = [super init];
    [self reload];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedflowschanged:) name:notflowschanged object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedflowschanged:(NSNotification*)notification
{
    [self reload];
}

#pragma mark public

-(void)reload
{
    self.items = [NSMutableArray array];
    
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
                           mlistitem *item = [[mlistitem alloc] init:rawpath];
                           
                           [self.items addObject:item];
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notflowsreload object:nil];
                   });
}

@end