//
//  FWURIRouter.h
//  Component
//
//  Created by YYInc on 2018/12/7.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  URIRegisterEvent(__NAME__,__PATH__) \
-(void)autoRegister##__NAME__{  \
 [self registerURI:__PATH__ event:^(NSDictionary *  userInfo,OpenBlock result){  \
    [self on##__NAME__##Action:userInfo result:result]; \
    }]; \
} \
-(void)on##__NAME__##Action:(NSDictionary *)userInfo  result:(OpenBlock)result \


typedef void(^OpenBlock)(BOOL result,id recever,id info);

typedef void(^RegisterBlock)(NSDictionary *userInfo,OpenBlock callBack);





@interface FWURIRouter : NSObject

+(instancetype)sharedInstance;


-(void)registerURI:(NSString*)path event:(RegisterBlock)event;

-(void)openURI:(NSString*)path userInfo:(NSDictionary*)userInfo result:(OpenBlock)result;


@end

