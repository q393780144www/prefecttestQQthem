//
//  YGHDetailViewController.h
//  Singin
//
//  Created by mac on 14-9-18.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGHDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *Portrait;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *qq;
@property (weak, nonatomic) IBOutlet UILabel *tel;
@property (weak, nonatomic) IBOutlet UILabel *mobile;
@property (copy,nonatomic)NSString *name1;
@end
