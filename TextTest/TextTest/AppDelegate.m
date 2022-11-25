//
//  AppDelegate.m
//  TextTest
//
//  Created by renxinwei on 2022/11/25.
//

#import "AppDelegate.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [TestViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
