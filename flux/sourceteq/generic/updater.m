#import "updater.h"

@implementation updater

NSString *documents;
NSString *flowsfolder;

+(void)launch
{
    [[analytics singleton] start];
    [updater update];
}

#pragma mark private

+(void)update
{
    documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    flowsfolder = [documents stringByAppendingPathComponent:@"flows"];
    NSDictionary *defaults = [tools defaultdict];
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    NSInteger def_version = [defaults[@"version"] integerValue];
    NSInteger pro_version = [[properties valueForKey:@"version"] integerValue];
    
    if(def_version != pro_version)
    {
        [properties setValue:@(def_version) forKeyPath:@"version"];        
        
        if(pro_version < 10)
        {
            [updater firsttime:defaults];
            [mdirs createdir:[NSURL fileURLWithPath:flowsfolder]];
            [mdb updatedb];
        }
    }
    
    dbname = [documents stringByAppendingPathComponent:[properties valueForKey:@"dbname"]];
}

+(void)firsttime:(NSDictionary*)plist
{
    NSNumber *appid = plist[@"appid"];
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    
    [userdef removePersistentDomainForName:NSGlobalDomain];
    [userdef removePersistentDomainForName:NSArgumentDomain];
    [userdef removePersistentDomainForName:NSRegistrationDomain];
    [userdef setValue:appid forKey:@"appid"];
    [userdef setValue:@0 forKey:@"ttl"];
    [userdef setValue:[[NSUUID UUID] UUIDString] forKey:@"uuid"];
    [userdef synchronize];
}

@end