//
//  YGHRootViewController.h
//  Singin
//
//  Created by mac on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGHUsers.h"
@class YGHModledictionary;

@interface YGHRootViewController : UIViewController<UIGestureRecognizerDelegate,YGHUsers>
@property (weak, nonatomic) IBOutlet UIImageView *qqimage;
@property (weak, nonatomic) IBOutlet UILabel *Passwordlabel;
@property (weak, nonatomic) IBOutlet UILabel *Registerlabel;
@property (weak, nonatomic) IBOutlet UIImageView *qq;
@property (weak, nonatomic) IBOutlet UIButton *Register;
@property (weak, nonatomic) IBOutlet UITextField *Account;
@property (weak, nonatomic) IBOutlet UIButton *Logon;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property(strong,nonatomic)NSMutableDictionary *dic;
@property(strong,nonatomic)UIAlertView *vie;
@property(nonatomic ,assign)NSUInteger users;
@property(strong,nonatomic) YGHModledictionary * Dic;
//@property (strong, nonatomic) IBOutlet UIView *View;
- (IBAction)Password:(UITextField *)sender;

- (IBAction)Account:(UITextField *)sender;
- (IBAction)Register:(UIButton *)sender;
- (IBAction)Logon:(UIButton *)sender;


@end
