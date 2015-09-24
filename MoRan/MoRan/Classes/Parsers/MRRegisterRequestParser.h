//
//  MRRegisterRequestParser.h
//  MRoran_iOS
//
//  Created by yikobe_mac on 15/9/21.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRUserModel.h"    

@interface MRRegisterRequestParser : NSObject

- (MRUserModel *)parseJson:(NSData *)data;

@end
