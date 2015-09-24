//
//  AppDelegate.h
//  MoRan
//
//  Created by yikobe_mac on 9/20/15.
//  Copyright © 2015 yikobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UIViewController *loginViewController;

- (void)loadLoginView;
- (void)loadMainView;


@end

