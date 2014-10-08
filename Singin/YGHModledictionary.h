//
//  YGHModledictionary.h
//  Singin
//
//  Created by YGH on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGHModledictionary : NSObject
{
    NSMutableDictionary *_dic;
    NSMutableString *_path;
    NSString *_pah1;
}
@property (strong,nonatomic) NSMutableDictionary *dic;
@property (strong,nonatomic) NSString *path;
@property (strong,nonatomic) NSString *path1;
+(YGHModledictionary *)creatdelegate;
@end
