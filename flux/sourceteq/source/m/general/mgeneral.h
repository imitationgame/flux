#import <Foundation/Foundation.h>

// app

// creator

typedef NS_ENUM(NSUInteger, colortype)
{
    colortype_main,
    colortype_blue,
    colortype_green,
    colortype_yellow,
    colortype_violet,
    colortype_grey,
    colortype_pink
};

// analytics

typedef NS_ENUM(NSUInteger, ga_screen)
{
    ga_screen_list,
    ga_screen_flow,
    ga_screen_detail,
    ga_screen_config
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_export,
    ga_event_save
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_error
};