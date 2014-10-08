//
//  YGHLinkmanViewController.m
//  Singin
//
//  Created by mac on 14-9-19.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHLinkmanViewController.h"
#import "YGHFirstTableViewCell.h"
#import "YGHRootViewController.h"
#import "MYinfo.h"
#import "Myinfomation.h"
#import "YGHAnimationtool.h"
#import "YGHEditViewController.h"
#import "YGHEdit.h"
@interface YGHLinkmanViewController ()<UITableViewDataSource,UITableViewDelegate,YGHEdit>
{
    UITableView *table;
    NSMutableArray *infoary;
    UIImageView *vie;
}
@end

@implementation YGHLinkmanViewController

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
    self.title=@"我";
    
    self.navigationController.navigationBar.hidden=NO;
    UIView *v=self.tabBarController.view.subviews[2];
    v.hidden=NO;
    self.navigationController.navigationBar.barStyle=UIBarStyleBlackTranslucent;
     self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:34/255.0 green:70/255.0 blue:142/255.0 alpha:1.0f];
    //self.navigationController.navigationBar.barTintColor=[[UIColor alloc]initWithRed:26/255.0 green:31/255.0 blue:33/255.0 alpha:1.0f];
}
-(void)creadata
{   NSArray *photo=@[@"photo.png",@"collect.png",@"money.png",@"mood.png",@"MoreSetting@2x.png",@"trash.png"];
    NSArray *phontname=@[@"相册",@"收藏",@"钱包",@"表情",@"设置",@"注销"];
    NSMutableArray *sec1=[[NSMutableArray alloc]init];
    NSMutableArray *sec2=[[NSMutableArray alloc]init];
    NSMutableArray *sec3=[[NSMutableArray alloc]init];
    Myinfomation *info=[[Myinfomation alloc]init];
    info.image=@"login.png";
    info.name=@"喻贵华";
    info.mood=@"牵左手不离，牵右手不弃";
    [sec1 addObject:info];
    [infoary addObject:sec1];
    for(NSUInteger i=0;i<3;i++)
    {
        MYinfo *fo=[[MYinfo alloc]init];
        fo.image=photo[i];
        fo.name=phontname[i];
        [sec2 addObject:fo];
        
    }
    [infoary addObject:sec2];
    for(NSUInteger i=3;i<6;i++)
    {
        MYinfo *fo=[[MYinfo alloc]init];
        fo.image=photo[i];
        fo.name=phontname[i];
        [sec3 addObject:fo];
        
    }
    [infoary addObject:sec3];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 420) style:UITableViewStyleGrouped];
    infoary=[[NSMutableArray alloc]init];
    [table registerNib:[UINib nibWithNibName:@"YGHFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    table.backgroundColor=[[UIColor alloc]initWithRed:235/255.0 green:235/255.0  blue:240/255.0  alpha:1.0f];
    table.dataSource=self;
    table.delegate=self;
    vie=[[UIImageView alloc]initWithFrame:self.view.bounds];
    vie.center=CGPointMake(-160, -240);
    vie.image=[UIImage imageNamed:@"ren.png"];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomm:)];
    vie.userInteractionEnabled=YES;
    [vie addGestureRecognizer:tap];
    [self creadata];
    [self.view addSubview:table];
    [self.view addSubview:vie];
    
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return infoary.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [infoary[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.section==0)
      return 90;
    else
        return 44;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    if(indexPath.section==2&&indexPath.row==2)
    {
        NSUserDefaults *user=[NSUserDefaults standardUserDefaults];
        [user setObject:@"1" forKey:@"users"];
               
        [_delegate setuseraccount:@"yuguihua" withpassword:@"123456"];
        [self.tabBarController.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight]forKey:nil];
               [self.tabBarController.navigationController popToRootViewControllerAnimated:YES];
    }
    else if(indexPath.section==0)
    {
        YGHEditViewController *edit=[[YGHEditViewController alloc]init];
        [self.navigationController.view.layer addAnimation:[YGHAnimationtool addAnimationwithanimationSubtType:kCATransitionFromRight]forKey:nil];
        NSArray *p=infoary[0];
        edit.person=p[0];
        edit.delegate=self;
        
        [self.navigationController pushViewController:edit animated:YES];
    }
    
}
-(void)setname:(NSString *)name withmood:(NSString *)mood withimage:(NSString *)image
{
    Myinfomation *person=[[Myinfomation alloc]init];
    person.image=image;
    person.name=name;
    person.mood=mood;
    NSArray *sec1=@[person];
    [infoary replaceObjectAtIndex:0 withObject:sec1];
    [table reloadData];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid1=@"cell1";
    static NSString *cellid=@"cell";
    if(indexPath.section==0)
    {
        YGHFirstTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid1];
        Myinfomation *my=infoary[0][0];
        cell.imageview1.image=[UIImage imageNamed:[my image]];
         cell.labelname.text=[my name];
         cell.labelmood.text=[my mood];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoom:)];
        cell.imageview1.userInteractionEnabled=YES;
        [cell.imageview1 addGestureRecognizer:tap];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
         return cell;
    }
    else
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
        if(cell==nil)
        {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        MYinfo *info=infoary[indexPath.section][indexPath.row];
        cell.imageView.image=[UIImage imageNamed:[info image]];
        cell.textLabel.text=[info name];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
         return cell;
    }
   
}
-(void)zoom:(UITapGestureRecognizer *)tap
{    self.navigationController.navigationBar.hidden=YES;
    UIView *v=self.tabBarController.view.subviews[2];
    v.hidden=YES;
    [UIView animateWithDuration:0.3f animations:^{
       vie.center=CGPointMake(160, 240);
    }];
}
-(void)zoomm:(UITapGestureRecognizer *)tap
{
    self.navigationController.navigationBar.hidden=NO;
    UIView *v=self.tabBarController.view.subviews[2];
    v.hidden=NO;
    [UIView animateWithDuration:0.3f animations:^{
        vie.center=CGPointMake(-160, -240);
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
