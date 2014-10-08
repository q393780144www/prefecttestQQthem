//
//  YGHSecoundViewController.m
//  Singin
//
//  Created by mac on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHSecoundViewController.h"
#import "YGHModledictionary.h"
#import "YGHAnimationtool.h"
#import <QuartzCore/QuartzCore.h>
@interface YGHSecoundViewController ()

@end

@implementation YGHSecoundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
     _Dic = [YGHModledictionary creatdelegate];
   
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd)];
    
    UIView *keyview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    keyview.backgroundColor=[UIColor clearColor];
    UIButton *bu1=[UIButton buttonWithType:UIButtonTypeCustom];
    bu1.frame=CGRectMake(260, 0, 60, 30) ;
    [bu1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[bu1 setTitle:@"隐藏 V" forState:UIControlStateNormal];
     [bu1 setImage:[UIImage imageNamed:@"key.png"] forState:UIControlStateNormal];
    [bu1 addTarget:self action:@selector(keyhidd) forControlEvents:UIControlEventTouchUpInside];
    [keyview addSubview:bu1];
    _Account.keyboardType=UIKeyboardTypeNumberPad;
    _Account.inputAccessoryView=keyview;
    _Password.inputAccessoryView=keyview;
    _Password1.inputAccessoryView=keyview;

    self.view.userInteractionEnabled=YES;
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view from its nib.
}
-(void)keyhidd
{
    [self.view endEditing:YES];
}
-(void)hidd
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Register:(UIButton *)sender {
     if([_Password.text isEqualToString:_Password1.text])
     {
         NSString *account=_Account.text;
         NSString *password=_Password.text;
         [_Dic.dic setValue:password forKey:account];
         if([_Dic.dic writeToFile:_Dic.path1 atomically:YES])
             NSLog(@"success");
         else
             NSLog(@"fail");
         [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromLeft]forKey:nil];
         [self.navigationController popToRootViewControllerAnimated:YES];
}
    else
    {
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"密码不相同请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_vie show];
        
    }
   
}
@end
