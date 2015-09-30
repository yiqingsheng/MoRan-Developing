//
//  AppDelegate.m
//  MoRan
//
//  Created by yikobe_mac on 9/20/15.
//  Copyright © 2015 yikobe. All rights reserved.
//

#import "AppDelegate.h"
#import "MRSquareViewController.h"
#import "MRMyViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (void)loadLoginView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginAndRegister" bundle:[NSBundle mainBundle]];
    self.loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginStoryboard"];
    self.window.rootViewController = self.loginViewController;
}

- (void)loadMainViewWithController:(UIViewController *)controller
{
    UIStoryboard *squareStoryboard = [UIStoryboard storyboardWithName:@"Square" bundle:[NSBundle mainBundle]];
    MRSquareViewController *squareVC = [squareStoryboard instantiateViewControllerWithIdentifier:@"SquareStoryboard"];
    squareVC.tabBarItem.title = @"广场";
    squareVC.tabBarItem.image = [UIImage imageNamed:@"square"];
    
    UIStoryboard *myStoryboard
    = [UIStoryboard storyboardWithName:@"My" bundle:[NSBundle mainBundle]];
    MRMyViewController *myVC = [myStoryboard instantiateViewControllerWithIdentifier:@"MyStoryboard"];
    myVC.tabBarItem.title = @"我的";
    myVC.tabBarItem.image = [UIImage imageNamed:@"my"];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[squareVC, myVC];
    
    // 登录成功后切换到tabBarController
    [controller presentViewController:self.tabBarController animated:YES completion:nil];
    
    // 添加切换页面的动画效果
    [self.window addSubview:self.loginViewController.view];
    [UIView animateWithDuration:3
                     animations:^{
                         self.loginViewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.loginViewController = nil;
                     }];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadLoginView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
