//
//  FWURIRouter+A.m
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "FWURIRouter+A.h"
#import <UIKit/UIKit.h>
#import "UserDetailViewController.h"

@implementation FWURIRouter (A)

URIRegisterEvent(A1, @"user/detail")
{
    NSLog(@"%@",userInfo);
    UINavigationController *navi = userInfo[@"navi"];
    [navi pushViewController:[UserDetailViewController new] animated:YES];
}



@end
