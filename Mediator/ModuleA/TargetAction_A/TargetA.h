//
//  TargetA.h
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TargetA : NSObject

-(UserDetailViewController*)createUserDetailViewController:(NSDictionary*)params;


@end

NS_ASSUME_NONNULL_END
