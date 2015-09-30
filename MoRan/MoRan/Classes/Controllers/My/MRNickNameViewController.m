//
//  MRNickNameViewController.m
//  MoRan
//
//  Created by yikobe_mac on 15/9/30.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import "MRNickNameViewController.h"

@interface MRNickNameViewController ()

@end

@implementation MRNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nickNameTextField.text = self.nickName;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:237 / 255.0f green:127 / 255.0f blue:74 / 255.0f alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)doneBarButtonClicked:(id)sender
{
    [self.delegate updateNickName:self.nickNameTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
