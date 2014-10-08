//
//  YGHSecoundViewController.h
//  Singin
//
//  Created by mac on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHModledictionary.h"
@interface YGHSecoundViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *Password1;
@property(strong,nonatomic)UIAlertView *vie;
@property(strong,nonatomic) YGHModledictionary * Dic;
- (IBAction)Register:(UIButton *)sender;


@end
