//
//  FWURIRouter.m
//  Component
//
//  Created by YYInc on 2018/12/7.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "FWURIRouter.h"
#import <objc/runtime.h>

@interface FWURIRouter()

@property(strong)NSMutableDictionary *uriDict;

@end

@implementation FWURIRouter

+(instancetype)sharedInstance
{
    static FWURIRouter *_center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _center = [[FWURIRouter alloc]init];
    });
    return _center;
}

-(void)registerURI:(NSString*)path event:(RegisterBlock)event
{
    if(!path){
        return;
    }
    if(!event){
        return;
    }
    
    if(!_uriDict){
        _uriDict = [[NSMutableDictionary alloc]init];
    }
    [_uriDict setObject:[event copy] forKey:path];
}

-(void)openURI:(NSString*)path userInfo:(NSDictionary*)userInfo result:(OpenBlock)result
{
    NSAssert([NSThread isMainThread], @"openURI should be call in main thread!");
    [self checkRegister];
    if(!path){
        return;
    }
    RegisterBlock  event = [_uriDict objectForKey:path];
    if(event){
        event(userInfo,result);
    }else{
        NSLog(@"not exist !");
    }
}

-(void)checkRegister
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        unsigned int methodCount = 0;
        Method *methods = class_copyMethodList(self.class, &methodCount);
        if (methods && methodCount > 0) {
            for (unsigned int i = 0; i < methodCount; i++) {
                SEL selector = method_getName(methods[i]);
                NSString *selectorName = NSStringFromSelector(selector);
                if ([selectorName hasPrefix:@"autoRegister"]) {
                    SEL selector = NSSelectorFromString(selectorName);
                    IMP imp = [self methodForSelector:selector];
                    void (*func)(id, SEL) = (void *)imp;
                    func(self, selector);
                }
            }
        }
        if (methods) {
            free(methods);
        }
    });
}



@end
