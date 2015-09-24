//
//  MRRegisterRequestParser.m
//  MRoran_iOS
//
//  Created by yikobe_mac on 15/9/21.
//  Copyright © 2015年 Brave. All rights reserved.
//

#import "MRRegisterRequestParser.h"

@implementation MRRegisterRequestParser

- (MRUserModel *)parseJson:(NSData *)data
{
    NSError *error = nil;
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    if (error) {
        NSLog(@"The parser is not work.");
    } else {
        if ([[jsonDic class] isSubclassOfClass:[NSDictionary class]]) {
            id returnMessage = [jsonDic valueForKey:@"message"];
            if ([[returnMessage class] isSubclassOfClass:[NSString class]]) {
                MRUserModel *user = [[MRUserModel alloc] init];
                user.registerReturnMessage = returnMessage;
                
                return user;
            }
        }
    }
    return nil;
}

@end
