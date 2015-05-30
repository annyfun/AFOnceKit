//
//  AppDelegate.m
//  AFOnceKitDemo
//
//  Created by Jinjin on 15/5/31.
//  Copyright (c) 2015年 AnnyFun. All rights reserved.
//

#import "AppDelegate.h"
#import "AFOnce.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //只执行一次
    [AFOnce runOnce:^(AFOnceBlockInfo *blockInfo){
        NSLog(@"Key1 Hello！我在App真个绳命周期内只会执行一次！");
    } forKey:@"Key1"];
    
    //若执行过一次了，则执行其他Block
    [AFOnce runOnce:^(AFOnceBlockInfo *blockInfo){
        NSLog(@"Key2 Hello我已经执行拉！");
    } elseRun:^(AFOnceBlockInfo *blockInfo){
        NSLog(@"Key2 我在%@已经执行过一次拉！所以以后都执行这个！",blockInfo.lastTime);
    } forKey:@"Key2"];
    
    //一定时间内只执行一次
    [AFOnce runOnce:^(AFOnceBlockInfo *blockInfo){
        NSLog(@"Key3 Hello我在15s内只执行一次！");
    } forKey:@"Key3" withInterval:15];
    
    //一定时间内只执行一次 否则执行其他Block
    [AFOnce runOnce:^(AFOnceBlockInfo *blockInfo) {
        NSLog(@"Key4 Hello我在15s内只执行一次！");
    } elseRun:^(AFOnceBlockInfo *blockInfo) {
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:blockInfo.lastTime];
        NSLog(@"Key4 我在%@已经执行过一次拉！还需要%f才能再次执行",blockInfo.lastTime,15-interval);
    } forKey:@"Key4" withInterval:15];
    
    //如果不修改CFBundleShortVersionString 只会执行一次
    [AFOnce runOncePerVersion:^(AFOnceBlockInfo *blockInfo) {
        NSLog(@"Key5 不修改App版本的 我只执行一次！！");
    } forKey:@"Key5"];
    
    
    
    //我还可以分组判断执行噢！！比如多用户的情况下！不同分组之间不干扰
    [AFOnce runOnce:^(AFOnceBlockInfo *blockInfo) {
        NSLog(@"User1Group Key2 Hello我已经执行拉！");
    } elseRun:^(AFOnceBlockInfo *blockInfo) {
        NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:blockInfo.lastTime];
        NSLog(@"User1Group Key2 我在%@已经执行过一次拉！还需要%f才能再次执行",blockInfo.lastTime,15-interval);
    } forKey:@"Key2" forGroup:@"User1Group" perVersion:YES interval:15];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
