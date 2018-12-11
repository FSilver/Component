//
//  ComponentA.m
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "ComponentA.h"
#import "FWComponentCenter.h"
#import "UserDetailProtocol.h"
#import <UIKit/UIKit.h>
#import "UserDetailViewController.h"

@interface ComponentA()<UserDetailProtocol>

@end

@implementation ComponentA

+ (void)load {
    FWRegisterComponent(self);
}

-(UIViewController*)getUserDetailController
{
    return [[UserDetailViewController alloc]init];
}

@end
