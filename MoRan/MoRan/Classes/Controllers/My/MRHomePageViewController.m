//
//  MRHomePageViewController.m
//  MoRan
//
//  Created by yikobe_mac on 15/9/30.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import "MRHomePageViewController.h"

@interface MRHomePageViewController ()

@end

@implementation MRHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showHomePage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)showHomePage
{
    NSString *urlString = @"http://geekband.com";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}


@end
