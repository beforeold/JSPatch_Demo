//
//  AppDelegate.m
//  TestJSPatch
//
//  Created by 席萍萍 on 16/6/27.
//  Copyright © 2016年 Bob. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JSPatch.h>

static NSString *const kJSPatchAppKey = @"enter your key";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self setupJSPatchOnlineParam];
    [self setupJSPatch];
    
    return YES;
}


/**
 *  设置在线参数，该功能与JSPatch脚本功能完全独立
 */
- (void)setupJSPatchOnlineParam {
    [JSPatch setupConfigInterval:5]; //// 该方法会修改下面方法的默认调用时间间隔（30min），用过下面方法来修改，调用失败则不会回调
    [JSPatch updateConfigWithAppKey:kJSPatchAppKey];
    [JSPatch setupUpdatedConfigCallback:^(NSDictionary *configs, NSError *error) {
        NSLog(@"configs %@, error %@", configs, error);
        

    }];

    [self getOnlineParam];

}

- (void)getOnlineParam {
    NSString *name = [JSPatch getConfigParam:@"name"]; // 全部参数
    NSDictionary *param = [JSPatch getConfigParams]; // 单一参数获取
    NSLog(@"name %@, param %@", name, param);
}


- (void)setupJSPatch {
     [JSPatch testScriptInBundle]; // 执行本地测试脚本，不可与startWithAppKey同时执行
    return;
    
    [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
        switch (type) {
            case JPCallbackTypeUnknow: {
                NSLog(@"JPCallbackTypeUnknow data %@, error %@", data, error);
                break;
            }
            case JPCallbackTypeRunScript: {
                NSLog(@"JPCallbackTypeRunScript data %@, error %@", data, error);
                break;
            }
            case JPCallbackTypeUpdate: {
                NSLog(@"JPCallbackTypeUpdate data %@, error %@", data, error);
                break;
            }
            case JPCallbackTypeUpdateDone: {
                NSLog(@"JPCallbackTypeUpdateDone data %@, error %@", data, error);
                break;
            }
            case JPCallbackTypeCondition: {
                NSLog(@"JPCallbackTypeCondition data %@, error %@", data, error);
                break;
            }
                
            case JPCallbackTypeGray: {
                NSLog(@"JPCallbackTypeGray data %@, error %@", data, error);
                break;
            }
        }
    }];
    
    
    // 1、启用服务
    [JSPatch startWithAppKey:kJSPatchAppKey];
    
#ifdef DEBUG
//    [JSPatch setupDevelopment]; // 开启开发预览模式，开启后才能在上传预览版补丁时收到补丁
#endif
    
    [JSPatch sync]; // 检查是否有patch更新，可多次调用，比如在becomeActive
    
    
    
}



@end
