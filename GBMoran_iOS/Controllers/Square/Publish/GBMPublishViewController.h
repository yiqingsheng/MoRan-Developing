//
//  CMJPublishViewController.h
//  GBMoran_iOS
//
//  Created by yikobe_mac on 15/9/21.
//  Copyright © 2015年 com.GeekBand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMPublishRequest.h"

@interface GBMPublishViewController : UIViewController <UITextViewDelegate,UITableViewDataSource,UITableViewDelegate,GBMPublishRequestDelegate>

@property (nonatomic, strong) UIImage *publishPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *pulishview;
@property (nonatomic, assign) NSInteger tag;

- (instancetype)initWithPulishPhoto:(UIImage*)pulishPhoto;


@end
