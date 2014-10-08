//
//  QFSecViewController.m
//  UITabBarController
//
//  Created by user on 14-9-19.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "QFSecViewController.h"

@interface QFSecViewController ()

@end

@implementation QFSecViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //所有对tabBar的初始化代码 一定要放到该方法中
        self.title = @"second";
        
        //2.
        //创建一个UITabBarItem
        
        /*
         UITabBarSystemItemMore,
         UITabBarSystemItemFavorites,
         UITabBarSystemItemFeatured,
         UITabBarSystemItemTopRated,
         UITabBarSystemItemRecents,
         UITabBarSystemItemContacts,
         UITabBarSystemItemHistory,
         UITabBarSystemItemBookmarks,
         UITabBarSystemItemSearch,
         UITabBarSystemItemDownloads,
         UITabBarSystemItemMostRecent,
         UITabBarSystemItemMostViewed,
         */
        self.tabBarItem.tag = 2;
        self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
        
        self.tabBarItem.badgeValue = @"45";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
