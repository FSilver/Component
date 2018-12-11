//
//  FWTargetAction+ModuleA.m
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "FWTargetAction+ModuleA.h"

NSString * const kTarget = @"TargetA";
NSString * const kActionUserDetail = @"createUserDetailViewController:";



@implementation FWTargetAction (ModuleA)

-(UIViewController*)getUserDetail
{
    return [self performTarget:kTarget action:kActionUserDetail params:@{@"info":@"targetAction"}];
}


@end
