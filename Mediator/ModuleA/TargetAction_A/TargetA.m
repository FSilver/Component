//
//  TargetA.m
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "TargetA.h"

@implementation TargetA

-(UserDetailViewController*)createUserDetailViewController:(NSDictionary*)params
{
    NSLog(@"%@",params);
    return [UserDetailViewController new];
}

@end
