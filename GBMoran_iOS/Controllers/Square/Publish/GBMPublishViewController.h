//
//  CMJPublishViewController.h
//  蓦然
//
//  Created by 陈铭嘉 on 15/9/21.
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