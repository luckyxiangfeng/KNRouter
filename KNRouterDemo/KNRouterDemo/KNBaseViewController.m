//
//  KNBaseViewController.m
//  KNRouterDemo
//
//  Created by Ken on 2019/7/8.
//  Copyright © 2019 ken. All rights reserved.
//

#import "KNBaseViewController.h"

@interface KNBaseViewController ()

@end

@implementation KNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试页面";
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    [btn setTitle:@"测试回传" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnSelect) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnSelect
{
    if (self.btnSelectCallBack){
        self.btnSelectCallBack(@"测试回传，回传成功");
    }
}
@end
