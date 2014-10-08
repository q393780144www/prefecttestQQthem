//
//  YGHThirdViewController.m
//  Singin
//
//  Created by mac on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHThirdViewController.h"
#import "YGHRootViewController.h"
#import "YGHAnimationtool.h"
#import <QuartzCore/QuartzCore.h>
#import "YGHDetailViewController.h"
#import "Customnavigation.h"
#import "ViewController.h"
@interface YGHThirdViewController ()
@property(nonatomic,strong)UIButton *bu1;
@property(nonatomic,strong)UIButton *bu2;
@property(nonatomic,strong)UILabel *label1;
@end

@implementation YGHThirdViewController
-(void)loadView
{
    [super loadView];
     self.view=[[NSBundle mainBundle]loadNibNamed:@"YGHThirdViewController" owner:self options:nil][0];
  
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
        //self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
        

        [self creatnagivation];
        
       
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
   self.navigationController.navigationBar.barStyle=UIBarStyleDefault;
    
 //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:34/255.0 green:70/255.0 blue:142/255.0 alpha:1.0f];
    
   }
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    [self creatnagivation];
    

}
-(void)creatnagivation
{   UIBarButtonItem *speace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    _bu1=[UIButton buttonWithType:UIButtonTypeCustom];
    _bu1.frame=CGRectMake(0, 0, 60, 40);
    [_bu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _bu1.tag=1;
    [_bu1 setTitle:@"上一个" forState:UIControlStateNormal];
     [_bu1 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    _label1 =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    _label1.textAlignment=NSTextAlignmentCenter;
    _label1.text=@"根控制器";
    _bu2=[UIButton buttonWithType:UIButtonTypeCustom];
    _bu2.frame=CGRectMake(0, 0, 60, 40);
    [_bu2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_bu2 setTitle:@"下一个" forState:UIControlStateNormal];
    _bu2.tag=2;
    [_bu2 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithCustomView:_bu1];
    UIBarButtonItem *bar1=[[UIBarButtonItem alloc]initWithCustomView:_label1];
    UIBarButtonItem *bar2=[[UIBarButtonItem alloc]initWithCustomView:_bu2];
    NSArray *ary=@[bar,speace,bar1,speace,bar2];
    self.navigationItem.leftBarButtonItems=ary;
}

-(void)go:(UIButton *)bu
{
    if(bu.tag==2)
    {  ViewController *next=[[ViewController alloc]init];
        [self.navigationController pushViewController:next animated:YES];
    }}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
