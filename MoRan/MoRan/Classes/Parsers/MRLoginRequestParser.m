//
//  MRLoginRequestParser.m
//  GBDemo05
//
//  Created by yikobe_mac on 9/17/15.
//  Copyright (c) 2015 yikobe. All rights reserved.
//

#import "MRLoginRequestParser.h"

@implementation MRLoginRequestParser

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
                user.loginReturnMessage = returnMessage;
                
                return user;
            }
        }
    }
    return nil;
}

@end
