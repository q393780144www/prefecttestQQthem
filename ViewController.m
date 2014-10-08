//
//  ViewController.m
//  Singin
//
//  Created by mac on 14-9-26.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
@property(nonatomic,strong)UIButton *bu1;
@property(nonatomic,strong)UIButton *bu2;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UIAlertView *alert;
@end

@implementation ViewController

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
    UIColor *red=[UIColor redColor];
     UIColor *blue=[UIColor blueColor];
     UIColor *purprle=[UIColor purpleColor];
     UIColor *orange=[UIColor orangeColor];
     UIColor *green=[UIColor greenColor];
     UIColor *yellow=[UIColor yellowColor];
     UIColor *gray=[UIColor grayColor];
    NSArray *colour=@[red,blue,purprle,orange,gray,green,yellow];
    self.view.backgroundColor=colour[arc4random_uniform(7)];
    _alert=[[UIAlertView alloc]initWithTitle:@"退回" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"返回根视图",@"返回前三个",@"返回前五个",@"返回上一个" ,nil];
    [self creatnagivation];
    // Do any additional setup after loading the view.
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        case 2:
            {
        
            NSArray *view1=self.navigationController.viewControllers;
                NSUInteger i=view1.count;
                if (i<4) {
                    UIAlertView *ar=[[UIAlertView alloc]initWithTitle:@"警告" message:@"视图数量小于返回数" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
                    [ar show];
                }
                else
                 [self.navigationController popToViewController:view1[i-4] animated:YES];
            }
            break;
        case 3:
        {
            NSArray *view1=self.navigationController.viewControllers;
            NSUInteger i=view1.count;
            if (i<6) {
                UIAlertView *ar=[[UIAlertView alloc]initWithTitle:@"警告" message:@"视图数量小于返回数" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
                [ar show];
            }
            else
            [self.navigationController popToViewController:view1[i-6] animated:YES];
        }            break;
        case 4:
            [self.navigationController popViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)creatnagivation
{   UIBarButtonItem *speace=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    _bu1=[UIButton buttonWithType:UIButtonTypeCustom];
    _bu1.frame=CGRectMake(0, 0, 60, 40);
    [_bu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _bu1.tag=1;
    [_bu1 setTitle:@"上一个" forState:UIControlStateNormal];
    [_bu1 setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateHighlighted];
    [_bu1 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    _label1 =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    _label1.textAlignment=NSTextAlignmentCenter;
      _label1.text=[NSString stringWithFormat:@"VC%d",self.navigationController.viewControllers.count];
    //_label1.text=@"根控制器";
    _bu2=[UIButton buttonWithType:UIButtonTypeCustom];
    [_bu2 setBackgroundImage:[UIImage imageNamed:@"blue.png"] forState:UIControlStateHighlighted];
    _bu2.frame=CGRectMake(0, 0, 60, 40);
    [_bu2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_bu2 setTitle:@"下一个" forState:UIControlStateNormal];
    _bu2.tag=2;
    [_bu2 addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithCustomView:_bu1];
    UIBarButtonItem *bar1=[[UIBarButtonItem alloc]initWithCustomView:_label1];
    UIBarButtonItem *bar2=[[UIBarButtonItem alloc]initWithCustomView:_bu2];
    NSArray *ary=@[bar,speace,bar1,speace,bar2,speace];
    self.navigationItem.leftBarButtonItems=ary;
}
-(void)go:(UIButton *)bu
{
    if(bu.tag==2)
    {  ViewController *next=[[ViewController alloc]init];
      
        [self.navigationController pushViewController:next animated:YES];
    }
    else
    {
        [_alert show];
        //NSLog(@"%@",NSStringFromCGRect(_bu2.frame));
        //[self.navigationController popViewControllerAnimated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
