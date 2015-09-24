//
//  MRLoginRequestParser.h
//  GBDemo05
//
//  Created by yikobe_mac on 9/17/15.
//  Copyright (c) 2015 yikobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRUserModel.h"

// 这个类是把JSON数据转换成model
@interface MRLoginRequestParser : NSObject

- (MRUserModel *)parseJson:(NSData *)data;

@end
