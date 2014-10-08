//
//  YGHAnimationtool.m
//  Singin
//
//  Created by mac on 14-9-17.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHAnimationtool.h"

@implementation YGHAnimationtool
+(CATransition *)addAnimationwithanimationSubtType:(NSString *)subType
{
    CATransition *animation=[CATransition animation];
    [animation setType:@"suckEffect"];
    [animation setSubtype:subType];
    [animation setDuration:1.0f];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    return animation;
}
@end
