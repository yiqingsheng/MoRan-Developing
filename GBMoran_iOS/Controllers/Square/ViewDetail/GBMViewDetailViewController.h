//
//  GBMViewDetailViewController.h
//  GBMoran_iOS
//
//  Created by yikobe_mac on 15/10/2.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMViewDetailRequest.h"

@interface GBMViewDetailViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,GBMViewDetailRequestDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *PhotoImage;
@property (copy,nonatomic ) NSString *pic_id;
@property (copy,nonatomic) NSString *pic_url;
@property (nonatomic, strong) NSArray *commentArr;

@end

