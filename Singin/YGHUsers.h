//
//  YGHUsers.h
//  Singin
//
//  Created by mac on 14-9-27.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YGHUsers <NSObject>

-(void)setuser:(NSUInteger *)user;
-(void)setuseraccount:(NSString *)account withpassword:(NSString *)password;
@end
