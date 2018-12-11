//
//  UserDetailProtocol.h
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UserDetailProtocol <NSObject>

-(UIViewController*)getUserDetailController;

@end

NS_ASSUME_NONNULL_END
