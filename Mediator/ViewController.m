//
//  ViewController.m
//  Mediator
//
//  Created by YYInc on 2018/12/11.
//  Copyright © 2018 YYInc. All rights reserved.
//

#import "ViewController.h"
#import "FWTargetAction+ModuleA.h"
#import "FWURIRouter.h"
#import "FWComponentCenter.h"
#import "UserDetailProtocol.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"跳转";
    self.array = @[@"Target_Action",@"Protocol_协议注册",@"Router_路由注册"];
    
   
    self.tableView  =[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0){
        
        UIViewController *controller = [[FWTargetAction sharedInstance]getUserDetail];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if(indexPath.row == 1){
        
        [[FWURIRouter sharedInstance]openURI:@"user/detail" userInfo:@{@"navi":self.navigationController,@"info":@"URIRouter"} result:^(BOOL result, id recever, id info) {
            
        }];
    }
    
     if(indexPath.row == 2){
         
         
        UIViewController *controller = [FWComponent(UserDetailProtocol) getUserDetailController];
         [self.navigationController pushViewController:controller animated:YES];
         
     }
    
    
}


@end
