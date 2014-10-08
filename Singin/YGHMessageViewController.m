//
//  YGHMessageViewController.m
//  Singin
//
//  Created by mac on 14-9-19.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHMessageViewController.h"
#import "YGHThirdViewController.h"
#import "YGHRootViewController.h"
#import "YGHAnimationtool.h"
#import <QuartzCore/QuartzCore.h>
#import "YGHDetailViewController.h"
#import "ViewController.h"
@interface YGHMessageViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *array1;
    NSMutableArray *array;
    NSArray *name;
    UIColor *color1;
    UIColor *color;
    NSArray *fun;
    UIBarButtonItem *speace;
    NSDictionary *dic;
    UINavigationBar *bar1;
   
}
@end
NSArray *name;
UIColor *color1;
@implementation YGHMessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { //self.view.backgroundColor=[UIColor redColor];
       
   
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    name=@[@"喻贵华",@"王威",@"李经晶",@"吴涛",@"马飞",@"林浩",@"赵虎",@"孙权",@"吴勇"];
    fun=@[@"contacts_add_moment@2x.png",@"tabbar_contactsHL@2x.png",@"contacts_add_friend@2x.png"];
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *path= [bundle pathForResource:@"detail.plist" ofType:nil];
    dic=[NSDictionary dictionaryWithContentsOfFile:path];
    
    _Thescrolview.indicatorStyle=1;
    array=[[NSMutableArray alloc]init];
    array1=[[NSMutableArray alloc]init];
  
    [_Thescrolview setContentOffset:CGPointMake(0, 40) animated:YES];
    _Thescrolview.bouncesZoom = NO;
    _Thescrolview.scrollsToTop=1;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidd)];
    _Thescrolview.userInteractionEnabled=YES;
    [_Thescrolview addGestureRecognizer:tap];
    _Thescrolview.contentSize=CGSizeMake(320.0, 1000.0);
    self.navigationController.navigationBarHidden=NO;
    // self.navigationController.toolbarHidden=NO;
    //self.tabBarController=NO;
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    color1=[[UIColor alloc]initWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
    color=[[UIColor alloc]initWithRed:96/255.0 green:175/255.0 blue:255/255.0 alpha:1.0f];
    speace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UISearchBar *ser=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 320, 40)];
    [self.view addSubview:ser];
    [self cratnavigationbarwithtoolbar];
    //self.navigationController.navigationBar.barTintColor=color;
    
}
-(void)hidd
{
    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:34/255.0 green:70/255.0 blue:142/255.0 alpha:1.0f];
    [self creatview];
    [self creatview];
    [self creatview];
    //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:26/255.0 green:31/255.0 blue:33/255.0 alpha:1.0f];
      self.navigationController.navigationBarHidden=NO;
    //[self cratnavigationbarwithtoolbar];
    
}
-(void)cratnavigationbarwithtoolbar//toolbar和navigationbar的初始化
{
    for(NSUInteger i=0;i<3;i++)
    {
        UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
        bu.frame=CGRectMake(0, 0, 40, 40);
       // [bu setImage:[UIImage imageNamed:fun[i]] forState:UIControlStateNormal];
//        [bu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       [bu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bu.highlighted=NO;
        bu.enabled=NO;
        bu.tag=i;
        if(i==1)
        {   bu.frame=CGRectMake(0, 0, 100, 40);
            [bu setTitle:@"联系人" forState:UIControlStateNormal];}
        if(i==2)
        {   bu.enabled=YES;
            [bu setImage:[UIImage imageNamed:fun[2]] forState:UIControlStateNormal];
            [bu setImage:[UIImage imageNamed:@"add_friend_icon_offical@2x.png"] forState:UIControlStateHighlighted];}
        [bu addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithCustomView:bu];
        [array1 addObject:bar];
        [array1 addObject:speace];
    }
    [array1 removeLastObject];
    self.navigationItem.leftBarButtonItems=array1;
   
    
  
    
    //    for(NSUInteger i=0;i<3;i++)
    //    {
    //        UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    //        bu.frame=CGRectMake(0, 0, 45, 40);
    //        [bu setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"b%d.png",i+1]] forState:UIControlStateNormal];
    //        UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithCustomView:bu];
    //        [array addObject:bar];
    //        [array addObject:speace];
    //    }
    //    [array removeLastObject];
    //    self.toolbarItems=array;
}
-(void)creatview//创建联系人列表
{   UISwipeGestureRecognizer *tap=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(trashappera:)];
    tap.direction=UISwipeGestureRecognizerDirectionLeft;
    NSUInteger i=[[_Thescrolview subviews] count]-1;
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(320, i*41, 360, 40)];
    UIButton *bu=[UIButton buttonWithType:UIButtonTypeCustom];
    bu.frame=CGRectMake(0, 0,40 , 40);
    
    UIButton *bu1=[UIButton buttonWithType:UIButtonTypeCustom];
    bu1.frame=CGRectMake(320, 0,40 ,40);
    [bu1 setBackgroundImage:[UIImage imageNamed:@"trash.png"] forState:UIControlStateNormal];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(100, 0, 100, 40)];
    lab.text=name[arc4random_uniform(8)];
    NSMutableArray *ary=dic[lab.text];
    
    [bu setBackgroundImage:[UIImage imageNamed:ary[0]]forState:UIControlStateNormal];
    lab.tag=2;
    view.tag=10+i;
    [bu addTarget:self action:@selector(detail:) forControlEvents:UIControlEventTouchUpInside];
    [bu1 addTarget:self action:@selector(trashdid:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bu];
    [view addSubview:bu1];
    [view addSubview:lab];
    view.userInteractionEnabled=YES;
    [view addGestureRecognizer:tap];
    view.backgroundColor=color1;
    
    [_Thescrolview addSubview:view];
    
    CGRect rect=CGRectMake(0, i*41, 360, 40);
    
    [UIView animateWithDuration:0.6f animations:^{
        view.frame=rect;
    }];
    
    
}
-(void)trashdid:(UIButton *)bu//删除联系人
{   NSUInteger __block i=0;
    UIView *view=[bu superview];
    [UIView animateWithDuration:0.5f animations:^{
        CGRect rect= CGRectMake(320, view.frame.origin.y,view.frame.size.width,view.frame.size.height);
        view.frame=rect;
        view.alpha=0.0f;
        NSArray *arry=view.superview.subviews;
        
        for(UIView * obj in arry)
        {
            
            if(obj.tag==view.tag)
            {
                break;
            }
            i++;
        }
        
    } completion:^(BOOL finished) {
        
        NSArray *arry=view.superview.subviews;
        
        for(NSUInteger j=i+1;j<[arry count];j++)
        {
            
            UIView *ve=arry[j];
            [UIView animateWithDuration:0.5f animations:^{
                CGRect rect= CGRectMake(0, ve.frame.origin.y-view.frame.size.height-1,view.frame.size.width,view.frame.size.height);
                ve.frame=rect;
            }];
        };
        
        [view removeFromSuperview];
        
        
        
    }];
    
}
-(void)trashappera:(UITapGestureRecognizer *)tap//出现删除按钮
{
    UIView *vie=tap.view;
    if (vie.frame.origin.x==0) {
        CGRect rect=CGRectMake(-40, vie.frame.origin.y, vie.frame.size.width,vie.frame.size.height );
        [UIView animateWithDuration:0.4f animations:^{
            vie.frame=rect;
            vie.backgroundColor=[[UIColor alloc]initWithRed:30/255.0 green:120/255.0 blue:210/255.0 alpha:1.0f];
        }];
    }
    else
    {
        CGRect rect=CGRectMake(0, vie.frame.origin.y, vie.frame.size.width,vie.frame.size.height );
        [UIView animateWithDuration:0.4f animations:^{
            vie.frame=rect;
            vie.backgroundColor=color1;
        }];
    }
    
}
-(void)go:(UIButton *)bu//功能按钮
{
    switch (bu.tag) {
        case 2:[self creatview];break;
            
        default:
            break;
    }
    
    
}
-(void)detail:(UIButton *)bu
{
    UILabel *lab=(UILabel *)[bu.superview viewWithTag:2];
    YGHDetailViewController *Detail=[[YGHDetailViewController alloc]init];
    Detail.name1=lab.text;
    [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight]forKey:nil];
    [self.navigationController pushViewController:Detail animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
