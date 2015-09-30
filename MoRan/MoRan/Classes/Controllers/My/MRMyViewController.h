//
//  MRMyViewController.h
//  MoRan
//
//  Created by yikobe_mac on 15/9/24.
//  Copyright © 2015年 yikobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRHeadImageViewController.h"
#import "MRNickNameViewController.h"

@interface MRMyViewController : UITableViewController <MRNickNameViewControllerDelegate, MRHeadImageViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end

