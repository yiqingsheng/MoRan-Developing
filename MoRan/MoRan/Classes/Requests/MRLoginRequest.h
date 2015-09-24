//
//  MRLoginRequest.h
//  MRoran_iOS
//
//  Created by yikobe_mac on 15/9/21.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRUserModel.h"

@class MRLoginRequest;

@protocol MRLoginRequestDelegate <NSObject>

- (void)loginRequestSuccess:(MRLoginRequest *)request user:(MRUserModel *)user;
- (void)loginRequestFailed:(MRLoginRequest *)request error:(NSError *)error;

@end

@interface MRLoginRequest : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSURLConnection *urlConnection;
@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, assign) id <MRLoginRequestDelegate> delegate;

- (void)sendLoginRequestWithEmail:(NSString *)email
                         password:(NSString *)password
                             gbid:(NSString *)gbid
                         delegate:(id <MRLoginRequestDelegate>)delegate;



@end
