//
//  FWTargetAction.h
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FWTargetAction : NSObject

+ (instancetype)sharedInstance;

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
