//
//  FWComponentCenter.h
//  Component
//
//  Created by YYInc on 2018/12/6.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define FWComponent(_protocol_)  (id<_protocol_>)[FWComponentCenter componentFor:@protocol(_protocol_)]

extern void FWRegisterComponent(Class cls);

@interface FWComponentCenter : NSObject

+(id)componentFor:(Protocol*)protocol;


@end

NS_ASSUME_NONNULL_END
