//
//  FWComponentCenter.m
//  Component
//
//  Created by YYInc on 2018/12/6.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "FWComponentCenter.h"

static NSMutableDictionary *__components = nil;
static void *const queueKey = (void *)&queueKey;
static dispatch_queue_t _eventQueue;

#define dispatch_sync_eventQueue(block) \
if(dispatch_get_specific(queueKey)){ \
block(); \
}else{   \
dispatch_sync(_eventQueue, block); \
}

#define dispatch_async_eventQueue(block) \
dispatch_async(_eventQueue, block);


void FWRegisterComponent(Class cls)
{
    if (!__components) {
        __components = [NSMutableDictionary dictionary];
    }
    NSString *key = NSStringFromClass(cls);
    [__components setObject:[NSNull null] forKey:key];
}



@interface FWComponentCenter()

@property(nonatomic,strong)NSMutableDictionary *instanceDict;

@end

@implementation FWComponentCenter


+(instancetype)sharedInstance
{
    static FWComponentCenter *_center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _center = [[FWComponentCenter alloc]init];
    });
    return _center;
}

#pragma mark - public

+(id)componentFor:(Protocol*)protocol
{
    return [[FWComponentCenter sharedInstance]componentFor:protocol];
}

#pragma mark - private

-(id)init{
    self = [super init];
    if(self){
        _eventQueue = dispatch_queue_create("com.fw.event.dispatch", NULL);
        void *nonNullValue = queueKey;
        dispatch_queue_set_specific(_eventQueue, queueKey, nonNullValue, NULL);
    }
    return self;
}

-(id)componentFor:(Protocol*)protocol
{
    __block id instance;
    dispatch_sync_eventQueue(^{
        NSArray *keys  = [__components allKeys];
        for (NSString *key in keys) {
            
            Class cls = NSClassFromString(key);
            if([cls conformsToProtocol:protocol]){
                
                id value = [__components objectForKey:key];
                if(!value || [value isKindOfClass:[NSNull class]]){
                    value = [[cls alloc]init];
                    [__components setObject:value forKey:key];
                }
                instance = value;
            }
        }
    });
    return instance;
}


@end
