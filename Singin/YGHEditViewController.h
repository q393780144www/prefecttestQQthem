//
//  YGHEditViewController.h
//  Singin
//
//  Created by mac on 14-9-27.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Myinfomation.h"
#import "YGHEdit.h"
@interface YGHEditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageview1;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextView *Singin;
@property(nonatomic,copy)NSString *image;
- (IBAction)Save:(UIButton *)sender;
@property(nonatomic,strong)id<YGHEdit>delegate;
@property(strong,nonatomic)Myinfomation *person;
@end
