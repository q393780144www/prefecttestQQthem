//
//  YGHEditViewController.m
//  Singin
//
//  Created by mac on 14-9-27.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHEditViewController.h"
#import "YGHAnimationtool.h"
@interface YGHEditViewController ()<UITextViewDelegate>

@end

@implementation YGHEditViewController

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
    self.navigationController.navigationBar.hidden=YES;
    UIView *v=self.tabBarController.view.subviews[2];
    v.hidden=YES;
    _Singin.tintColor=[UIColor redColor];
    _Singin.delegate=self;
    _Singin.clearsOnInsertion=YES;
    _Singin.layer.borderColor=[UIColor redColor].CGColor;
    _Singin.layer.borderWidth=2.0f;
  
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd)];
    [self.view addGestureRecognizer:tap];
    self.view.userInteractionEnabled=YES;
    _image=_person.image;
   _imageview1.image=[UIImage imageNamed:_person.image];
   _Name.text=_person.name;
   _Singin.text=_person.mood;
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)Save:(UIButton *)sender {
    [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight] forKey:nil];
    [_delegate setname:_Name.text withmood:_Singin.text withimage:_image];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
