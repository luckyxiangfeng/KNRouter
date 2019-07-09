//
//  KNRouter.m
//  KNRouterDemo
//
//  Created by Ken on 2019/7/8.
//  Copyright © 2019 ken. All rights reserved.
//

#import "KNRouter.h"

@implementation KNRouter

+ (instancetype)sharedManager{
    
    static KNRouter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)openUrl:(NSString *)url{
    
    [self openUrl:url completion:nil];
    
}
- (void)openUrl:(NSString *)url completion:(void(^)(NSDictionary *parameter))completion{
    
    NSString *decodedUrl = url;
    //去除空格
    NSCharacterSet  *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    decodedUrl = [decodedUrl stringByTrimmingCharactersInSet:set];
    NSString *encodeUrl = [decodedUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    if ([decodedUrl hasPrefix:@"http://"] || [decodedUrl hasPrefix:@"https://"]) {
        
    }else{
        if ([encodeUrl hasPrefix:KN_NATIVE]) {
            NSString *jsonString = [decodedUrl substringFromIndex:KN_NATIVE.length];
            NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
            NSError *error = nil;
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
            if (error) {
                NSLog(@"jsonValueDecoded error:%@", error);
                return;
            }
            NSString *className = [jsonDic objectForKey:@"class"];
            //判断一个类是否存在
            if ((NSClassFromString(className)) == nil) {
                NSLog(@"不存在的类名");
                return;
            }
            
            id classObject = [[NSClassFromString(className) alloc] init];
            if (self.jumpType==KN_JUMP_TYPE_PRESENT) {
                //该导航栏可换为自定义后的导航栏控制器
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:classObject];
                [self.routerNav presentViewController:nav animated:YES completion:^{
                    if (completion) {
                        completion(nil);
                    }
                }];
            }else{
                
                [self.routerNav pushViewController:classObject animated:YES];
            }
        }
        if ([encodeUrl hasPrefix:KN_WEBVIEW]) {
            
        }
    }

    
}
- (void)setRouterNav:(UINavigationController *)routerNav{
    
    _routerNav = routerNav;
}
@end
