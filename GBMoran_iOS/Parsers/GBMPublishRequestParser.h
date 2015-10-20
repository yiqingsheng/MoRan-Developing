//
//  GBMPublishRequestParser.h
//  GBMoran_iOS
//
//  Created by yikobe_mac on 15/9/23.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBMPublishModel.h"

@interface GBMPublishRequestParser : NSObject


-(GBMPublishModel*)parseJson:(NSData *)data;


@end
