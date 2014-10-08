//
//  YGHTrendsViewController.m
//  Singin
//
//  Created by mac on 14-9-19.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHTrendsViewController.h"

@interface YGHTrendsViewController ()
{
    UIImageView *image;
    NSTimer *timer;
}
@end

@implementation YGHTrendsViewController

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
    self.title=@"发现";
    self.navigationController.navigationBarHidden=NO;
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
     self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:34/255.0 green:70/255.0 blue:142/255.0 alpha:1.0f];
    //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:26/255.0 green:31/255.0 blue:33/255.0 alpha:1.0f];
    timer=[NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(go:) userInfo:image repeats:YES];
    [self.view addSubview:image];
 
}
-(void)viewWillDisappear:(BOOL)animated
{
  
    [timer invalidate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
   image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 212, 212)];
    image.center=CGPointMake(160, 240);
    self.view.backgroundColor=[UIColor blackColor];
    image.image=[UIImage imageNamed:@"leida.png"];
  
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)go:(NSTimer *)im
{
    UIImageView *ve=(UIImageView *) im.userInfo;
    ve.transform=CGAffineTransformRotate(ve.transform,M_PI_2);
  
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
