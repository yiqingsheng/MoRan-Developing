//
//  MRRegisterRequest.h
//  MRoran_iOS
//
//  Created by yikobe_mac on 15/9/21.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRUserModel.h"

@class MRRegisterRequest;

@protocol MRRegisterRequestDelegate <NSObject>

- (void)registerRequestSuccess:(MRRegisterRequest *)request user:(MRUserModel *)user;
- (void)registerRequestFailed:(MRRegisterRequest *)request error:(NSError *)error;

@end


@interface MRRegisterRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <MRRegisterRequestDelegate> delegate;

- (void)sendRegisterRequestWithUserName:(NSString *)username
                                  email:(NSString *)email
                               password:(NSString *)password
                                   gbid:(NSString *)gbid
                               delegate:(id <MRRegisterRequestDelegate>)delegate;


@end
