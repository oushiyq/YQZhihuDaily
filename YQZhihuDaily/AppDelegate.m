//
//  AppDelegate.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/3.
//  Copyright © 2016年 user. All rights reserved.
//

#import "AppDelegate.h"
#import "YQLeftDrawer.h"
#import "YQMainViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //MMDrawerController需要一个中心视图centerController，左抽屉视图leftDrawerController，将他们初始化。
    YQMainViewController *mainController = [[YQMainViewController alloc]init];
    YQLeftDrawer *leftController = [[YQLeftDrawer alloc]init];
    UINavigationController *centerController = [[UINavigationController alloc]initWithRootViewController:mainController];
    centerController.navigationBarHidden = YES;
    //初始化MMDrawerController
    MMDrawerController *drawerContrller = [[MMDrawerController alloc]initWithCenterViewController:centerController leftDrawerViewController:leftController];
    
    //设置drawerContrller的左抽屉宽度，以及抽出弹性和阴影
    drawerContrller.maximumLeftDrawerWidth = 200;
    drawerContrller.shouldStretchDrawer = NO;
    drawerContrller.showsShadow = NO;
    
    //drawerContrller打开/关闭手势作用域
    drawerContrller.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerContrller.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    #warning （TODO 后期要改为launchView）
    //将drawerContrller作为载入视图
    self.window.rootViewController = drawerContrller;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
