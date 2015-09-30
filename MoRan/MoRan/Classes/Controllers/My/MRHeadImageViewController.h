//
//  MRHeadImageViewController.h
//  MoRan
//
//  Created by yikobe_mac on 15/9/30.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MRHeadImageViewController;

@protocol MRHeadImageViewControllerDelegate <NSObject>

- (void)updateHeadImage:(UIImage *)newImage;

@end

@interface MRHeadImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UIButton *changeHeadImageButton;
@property (nonatomic, weak) UIImage *headImage;
@property (nonatomic, weak) id <MRHeadImageViewControllerDelegate> delegate;

- (IBAction)doneBarButtonClicked:(id)sender;
- (IBAction)changeHeadImageButtonClicked:(id)sender;

@end
