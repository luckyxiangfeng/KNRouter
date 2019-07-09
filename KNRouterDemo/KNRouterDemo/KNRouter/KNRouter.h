//
//  KNRouter.h
//  KNRouterDemo
//
//  Created by Ken on 2019/7/8.
//  Copyright © 2019 ken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define KN_NATIVE @"qj://open/native?info="
#define KN_WEBVIEW @"qj://open/webview?info="

typedef enum : NSUInteger {
    KN_JUMP_TYPE_PUSH,
    KN_JUMP_TYPE_PRESENT
} KN_JUMP_TYPE;

NS_ASSUME_NONNULL_BEGIN

typedef void(^KNRouterHandler)(NSDictionary *parameter);
typedef void(^KNRouterCallbackHandler)(NSDictionary *parameter);

@interface KNRouter : NSObject
@property (nonatomic, strong) UINavigationController *routerNav;
@property (nonatomic, assign) KN_JUMP_TYPE jumpType;

+ (instancetype)sharedManager;

/**
 打开URL
 @param url 带 Scheme
 如  qj://open/native?info={"class":"KNBaseViewController","parms":{"a":"aaaa","b":"bbb"}}
 */
- (void)openUrl:(NSString *)url;

- (void)openUrl:(NSString *)url completion:( void(^_Nullable)(NSDictionary *parameter))completion;

@end

NS_ASSUME_NONNULL_END
