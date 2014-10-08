//
//  YGHDetailViewController.m
//  Singin
//
//  Created by mac on 14-9-18.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHDetailViewController.h"
#import "YGHAnimationtool.h"

@interface YGHDetailViewController ()
{
    NSDictionary *dic;
}
@end

@implementation YGHDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path= [bundle pathForResource:@"detail.plist" ofType:nil];
    dic=[NSDictionary dictionaryWithContentsOfFile:path];
      NSArray *arry =dic[_name1];
    _Portrait.image=[UIImage imageNamed:arry[0]];
    _name.text=arry[1];
    _sex.text=arry[2];
    _age.text=arry[3];
    _qq.text=arry[4];
    self.navigationItem.title=@"详细资料";
    self.navigationController.navigationBar.barTintColor=[UIColor redColor];
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithTitle:@"返回" style: UIBarButtonItemStyleBordered target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem =back;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)back:(UIBarButtonItem *)barItem
{
    [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromLeft ] forKey:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
