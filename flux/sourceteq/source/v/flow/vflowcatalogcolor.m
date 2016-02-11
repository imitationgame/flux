#import "vflowcatalogcolor.h"

@implementation vflowcatalogcolor

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
        [flow addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[catalog(120)]-0-|" options:0 metrics:metrics views:views]];
    }
}

-(instancetype)init:(vflow*)flow
{
    self = [super init];
    
    self.flow = flow;
    
    return self;
}

@end