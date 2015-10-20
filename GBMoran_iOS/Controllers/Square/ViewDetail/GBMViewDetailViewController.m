//
//  GBMViewDetailViewController.m
//  GBMoran_iOS
//
//  Created by yikobe_mac on 15/10/2.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import "GBMViewDetailViewController.h"
#import "GBMGlobal.h"

@interface GBMViewDetailViewController () <GBMViewDetailRequestDelegate>
{
    UIActivityIndicatorView *activity;
}

@end

@implementation GBMViewDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    CGFloat width =self.view.frame.size.width/2;
    [activity setCenter:CGPointMake(width , 160) ];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activity];
    [activity startAnimating];
    
    
    NSString *token = [GBMGlobal shareGloabl].user.token;
    NSString *userId = [GBMGlobal shareGloabl].user.userId;
    NSDictionary *dic = @{@"pic_id":_pic_id,@"token":token,@"user_id":userId};
    GBMViewDetailRequest *request = [[GBMViewDetailRequest alloc]init];
    [request sendViewDetailRequestWithParameter:dic delegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewDetailRequestSuccess:(GBMViewDetailRequest *)request data:(NSData *)data{
    _PhotoImage.image = [[UIImage alloc]initWithData:data];
    [activity stopAnimating];
}

- (void)viewDetailRequestFailed:(GBMViewDetailRequest *)request error:(NSError *)error{
    [activity stopAnimating];
}


@end
