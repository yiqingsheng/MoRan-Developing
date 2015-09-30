//
//  MRNickNameViewController.h
//  MoRan
//
//  Created by yikobe_mac on 15/9/30.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRNickNameViewController;

@protocol MRNickNameViewControllerDelegate <NSObject>

- (void)updateNickName:(NSString *)newName;

@end

@interface MRNickNameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (nonatomic, weak) NSString *nickName;
@property (nonatomic, weak) id <MRNickNameViewControllerDelegate> delegate;

- (IBAction)doneBarButtonClicked:(id)sender;

@end

