#import "msettings.h"

@implementation msettings

+(instancetype)singleton
{
    static msettings *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *settings = [defaults valueForKey:@"settings"];
    
    if(settings)
    {
        
    }
    
    return self;
}

#pragma mark public

-(void)save
{
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
}

@end