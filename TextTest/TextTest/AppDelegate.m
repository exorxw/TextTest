//
//  AppDelegate.m
//  TextTest
//
//  Created by renxinwei on 2022/11/25.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
    NSLog(@"app language:%@", [NSLocale preferredLanguages]);
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        NSLog(@"--- %@ ---", fontFamilyName);
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            NSLog(@"%@", fontName);
        }
    }
    
    return YES;
}


@end
