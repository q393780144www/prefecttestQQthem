//
//  YGHRootViewController.m
//  Singin
//
//  Created by mac on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHRootViewController.h"
#import "YGHSecoundViewController.h"
#import  "YGHThirdViewController.h"
#import "YGHModledictionary.h"
#import "YGHAnimationtool.h"
#import <QuartzCore/QuartzCore.h>
#import "YGHMessageViewController.h"
#import "YGHTrendsViewController.h"
#import "YGHLinkmanViewController.h"
@interface YGHRootViewController ()<UITabBarControllerDelegate,UIScrollViewDelegate>

{
    UITabBarController *tab;
    UIView *view;
    UIButton *oldbut;
    YGHLinkmanViewController *link;
}
@end


@implementation YGHRootViewController
-(void)loadView
{
    [super loadView];
    self.view=[[NSBundle mainBundle]loadNibNamed:@"YGHRootViewController" owner:self options:nil][0];
}
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
    self.navigationController.navigationBarHidden=YES;
    self.navigationController.toolbarHidden=YES;
     YGHModledictionary *dic2=[[YGHModledictionary alloc]init];
     _Dic=[YGHModledictionary creatdelegate];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd)];
    self.view.userInteractionEnabled=YES;
    [self.view addGestureRecognizer:tap];
    self.navigationController.navigationBarHidden=YES;
    UIView *ve=[self.view subviews][0];
    ve.alpha=0.0f;
    UIView *keyview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    keyview.backgroundColor=[UIColor clearColor];
    UIButton *bu1=[UIButton buttonWithType:UIButtonTypeCustom];
    bu1.frame=CGRectMake(200, 0, 120, 30) ;
    [bu1 setTitle:@"隐藏" forState:UIControlStateNormal];
    [bu1 setImage:[UIImage imageNamed:@"key.png"] forState:UIControlStateNormal];
    
    [bu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [bu1 addTarget:self action:@selector(keyhidd) forControlEvents:UIControlEventTouchUpInside];
    [keyview addSubview:bu1];
    _Account.keyboardType=UIKeyboardTypeNumberPad;
    _Password.inputAccessoryView=keyview;
     _Account.inputAccessoryView=keyview;
    //NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
 
   [self creatscrollview];
   
    [self creatview];
    [self creatTabbar];
   
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)keyhidd
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)creatscrollview
{
    UIView *view1=[[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:view1];
    UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    scroll.contentSize=CGSizeMake(320*6, 480);
    scroll.pagingEnabled=YES;

    scroll.bounces=YES;
    scroll.showsHorizontalScrollIndicator=NO;
    scroll.showsVerticalScrollIndicator=NO;
    for (NSUInteger i=1; i<6; i++) {
        UIImageView *vie=[[UIImageView alloc]initWithFrame:CGRectMake(320*(i-1), 0, 320, 480)];
        vie.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [scroll addSubview:vie];
       }
   UIImageView *vie=[[UIImageView alloc]initWithFrame:CGRectMake(320*5, 0, 320, 480)];
    vie.image=[UIImage imageNamed:@"6.jpg"];
   // UIPanGestureRecognizer *ges=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(remove:)];
    //vie.userInteractionEnabled=YES;
    // [vie addGestureRecognizer:ges];
    
    scroll.delegate=self;

    

    [scroll addSubview:vie];
    [view1 addSubview:scroll];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scrollView.contentOffset.x>1680)
    {
        [self removescroll:scrollView];
        
    }
}
-(void)removescroll:(UIScrollView *)scroll
{
    [UIView animateWithDuration:1.0f animations:^{
      scroll.alpha=0.0f;
        UIView *vi=self.view.subviews[0];
        vi.alpha=1.0f;
        
    }];
    [self.view sendSubviewToBack:scroll.superview];
    
}

-(void)remove:(UIPanGestureRecognizer *)tap//这是利用手势remove
{
    [UIView animateWithDuration:1.0f animations:^{
      tap.view.superview.alpha=0.0f;
      UIView *ve=[self.view subviews][0];
       ve.alpha=1.0f;
      
  }];
    [tap.view.superview.superview removeFromSuperview];
    }
-(void)hidd
{
    [self.view endEditing:YES];
}
-(void)set:(NSMutableDictionary *)dic
{
    
    _dic=[[NSMutableDictionary alloc]initWithDictionary:dic];
}



- (IBAction)Password:(UITextField *)sender {
   
    [sender resignFirstResponder];
     [self Logon:nil];
}

- (IBAction)Account:(UITextField *)sender {
      [sender resignFirstResponder];
}

- (IBAction)Register:(UIButton *)sender {
  
    YGHSecoundViewController *sen=[[YGHSecoundViewController alloc]init];
    [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight]forKey:nil];
    [self.navigationController pushViewController:sen animated:YES];
}
-(void)creatTabbar
{
   tab=[[UITabBarController alloc]init];
    YGHMessageViewController *message=[[YGHMessageViewController alloc]init];
    YGHTrendsViewController *trends=[[YGHTrendsViewController alloc]init];
    YGHThirdViewController *third=[[YGHThirdViewController alloc]init];
    link=[[YGHLinkmanViewController alloc]init];
    UINavigationController *mvc=[[UINavigationController alloc]initWithRootViewController:third];
    UINavigationController *mvc1=[[UINavigationController alloc]initWithRootViewController:message];
    UINavigationController *mvc2=[[UINavigationController alloc]initWithRootViewController:trends];
    UINavigationController *mvc3=[[UINavigationController alloc]initWithRootViewController:link];
    tab.tabBar.hidden=YES;
    tab.delegate=self;
    [tab.view addSubview:view];

    tab.viewControllers=@[mvc,mvc1,mvc2,mvc3];
}
-(void)creatview
{
    view=[[UIView alloc]initWithFrame:CGRectMake(0,420, 320, 60)];
    view.clipsToBounds=YES;
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    NSArray *ary=@[@"循环",@"通信录",@"发现",@"我"];
    [image setImage:[UIImage imageNamed:@"TtabbarBkg@2x.png"]];
    [view addSubview:image];
    for(NSUInteger i=0;i<4;i++)
    {
        UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(i*80+20,40, 50, 20)];
        label.textColor=[UIColor whiteColor];
        label.font=[UIFont systemFontOfSize:12];
        label.text=ary[i];
        label.tag=i+4;
        but.tag=i;
        label.textAlignment=NSTextAlignmentCenter;
        but.frame=CGRectMake(i*80+25, 0, 40, 40) ;
        [but setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Ttabbar_%d@2x.png",i+1]] forState:UIControlStateNormal];
        [but setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Ttabbar_press%d@2x.png",i+1]] forState:UIControlStateSelected];
        
        [but addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        but.tag=i;
        [view addSubview:but];
        [view addSubview:label];
    }
  
}
-(void)action:(UIButton *)but
{
    oldbut.selected=0;
    oldbut=but;
    for (NSUInteger i=0; i<4; i++) {
        UILabel *label=(UILabel *)[but.superview viewWithTag:i+4];
        label.textColor=[UIColor whiteColor];
    }
    UILabel *label=(UILabel *)[but.superview viewWithTag:but.tag+4];
    label.textColor=[[UIColor alloc]initWithRed:38/255.0 green:138/255.0 blue:255/255.0 alpha:0.8f];
    but.selected=1;
    switch (but.tag) {
        case 0:
            tab.selectedIndex=0;
            break;
        case 1:
             tab.selectedIndex=1;
            break;
        case 2:
            tab.selectedIndex=2;
            break;
        case 3:
            tab.selectedIndex=3;
            break;
        default:
            break;
    }
    
}
- (IBAction)Logon:(UIButton *)sender {
    //YGHModledictionary *Dic=[YGHModledictionary creatdelegate];

    NSMutableDictionary *dic2=_Dic.dic;
    if([dic2[_Account.text] isEqualToString:_Password.text])
    {
        

        
        [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight]forKey:nil];

        link.delegate=self;
 
        [self.navigationController pushViewController:tab animated:YES];
         }
    else
    {
        _vie=[[UIAlertView alloc]initWithTitle:@"通知" message:@"密码或账号不对请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_vie show];
    }
   
        
}
-(void)setuser:(NSUInteger *)user
{
    _users=1;
}
-(void)setuseraccount:(NSString *)account withpassword:(NSString *)password
{
    _Account.text=account;
    _Password.text=password;
}
@end
