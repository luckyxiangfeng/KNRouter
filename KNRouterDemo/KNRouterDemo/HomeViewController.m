//
//  HomeViewController.m
//  KNRouterDemo
//
//  Created by Ken on 2019/7/8.
//  Copyright © 2019 ken. All rights reserved.
//

#import "HomeViewController.h"
#import "KNRouter/KNRouter.h"
#import "Json/JSONKit.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSDictionary *parms = @{@"a":@"aaaa",@"b":@"bbb"};
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"KNBaseViewController" forKey:@"class"];
    [dic setObject:parms forKey:@"parms"];
    NSString *url = [NSString stringWithFormat:@"%@%@",KN_NATIVE,[dic JSONString]];
    //设置navigationController
    [KNRouter sharedManager].routerNav = self.navigationController;
    [KNRouter sharedManager].jumpType = KN_JUMP_TYPE_PRESENT;
//    [[KNRouter sharedManager] openUrl:url];
    [[KNRouter sharedManager] openUrl:url completion:^(NSDictionary * _Nonnull parameter) {
        
    }];
}


@end
