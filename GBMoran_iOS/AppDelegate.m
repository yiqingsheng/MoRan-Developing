//
//  AppDelegate.m
//  GBMoran_iOS
//
//  Created by yikobe_mac on 9/21/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import "AppDelegate.h"
#import "GBMLoginViewController.h"
#import "GBMSquareViewController.h"
#import "GBMMyViewController.h"
#import "GBMPublishViewController.h"

#define viewwidth self.window.frame.size.width
#define viewheight self.window.frame.size.height

@interface AppDelegate () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UIImagePickerController *pickerController;

@end

@implementation AppDelegate

- (void)loadLoginView
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"GBMLoginAndRegister" bundle:[NSBundle mainBundle]];
    self.loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginStoryboard"];
    self.window.rootViewController = self.loginViewController;
}

- (void)loadMainViewWithController:(UIViewController *)controller
{
    UIStoryboard *squareStoryboard = [UIStoryboard storyboardWithName:@"GBMSquare" bundle:[NSBundle mainBundle]];
    GBMSquareViewController *squareVC = [squareStoryboard instantiateViewControllerWithIdentifier:@"SquareStoryboard"];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:squareVC];
    nav1.navigationBar.barTintColor = [[UIColor alloc]initWithRed:230 / 255.0 green:106 / 255.0 blue:58 / 255.0 alpha:1];
    nav1.tabBarItem.title = @"广场";
    nav1.tabBarItem.image = [UIImage imageNamed:@"square"];
    
    UIStoryboard *myStoryboard
    = [UIStoryboard storyboardWithName:@"GBMMy" bundle:[NSBundle mainBundle]];
    GBMMyViewController *myVC = [myStoryboard instantiateViewControllerWithIdentifier:@"MyStoryboard"];
    myVC.tabBarItem.title = @"我的";
    myVC.tabBarItem.image = [UIImage imageNamed:@"my"];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[nav1, myVC];
    
    // 添加切换页面的动画效果
    [controller presentViewController:self.tabBarController animated:YES completion:nil];
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.loginViewController.view.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.loginViewController = nil;
                     }];
    
    UIButton *photoButton = [[UIButton alloc]initWithFrame:CGRectMake(viewwidth / 2 - 60, -25, 120, 50)];
    [photoButton setImage:[UIImage imageNamed:@"publish"] forState:UIControlStateNormal];
    [photoButton addTarget:self
                    action:@selector(addOrderView)
          forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarController.tabBar addSubview:photoButton];
}

- (void)addOrderView
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"拍照", @"从手机相册选择", nil];
    [sheet showInView:self.tabBarController.view];
}

#pragma mark - UIActionSheet delegate method

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.pickerController = [[UIImagePickerController alloc]init];;
    if (buttonIndex == 0) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            self.pickerController.allowsEditing = YES;
            self.pickerController.delegate = self;
            [self.tabBarController presentViewController:self.pickerController animated:YES completion:nil];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"无法获取照相机" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
            [alert show];
            return;
        }
    } else if(buttonIndex == 1){
        self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.pickerController.delegate = self;
        [self.tabBarController presentViewController:self.pickerController animated:YES completion:nil];
    }
}

#pragma mark - UIImagePickerController delegate method

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    CGSize imagesize = image.size;
    imagesize.height = 626;
    imagesize.width = 413;
    image = [self imageWithImage:image scaledToSize:imagesize];
    
    if (self.pickerController.sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"GBMPublish" bundle:nil];
        GBMPublishViewController *pulish = [story instantiateViewControllerWithIdentifier:@"CMJ"];
        pulish.tag = 2;
        pulish.publishPhoto = image;
        [picker pushViewController:pulish animated:YES];
    } else {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"GBMPublish" bundle:nil];
        GBMPublishViewController *pulish =  [story instantiateViewControllerWithIdentifier:@"CMJ"];
        UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:pulish];
        pulish.tag = 1;
        [picker presentViewController:navigationController animated:YES completion:nil];
    }
}


// 对图片尺寸进行压缩
- (UIImage *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{

    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self loadLoginView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}


@end
