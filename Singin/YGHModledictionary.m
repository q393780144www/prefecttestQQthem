//
//  YGHModledictionary.m
//  Singin
//
//  Created by YGH on 14-9-16.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "YGHModledictionary.h"
static YGHModledictionary *delegate;
@implementation YGHModledictionary
+(YGHModledictionary *)creatdelegate
{      if(delegate==nil)
{
    
        delegate=[[YGHModledictionary alloc]init];
    
}
    return delegate;
  
}
+(id)allocWithZone:(struct _NSZone *)zone
{
    if (delegate==nil) {
        delegate=[super allocWithZone:zone];
    }
    return delegate;
}
-(id)init
{
    self=[super init];
    if (self) {
        NSBundle *bundle=[[NSBundle mainBundle]init];
        NSString *st=[bundle pathForResource:@"key.plist" ofType:nil];
        
        delegate.path=[NSMutableString stringWithString:st];
        
        delegate.path1=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"key.plist"];
        //    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
        //    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]);
        //    NSLog(@"%@",NSTemporaryDirectory());
        //      NSLog(@"%@",NSHomeDirectory());
        //      NSLog(@"%@",[[NSBundle mainBundle]infoDictionary]);
        if([NSMutableDictionary dictionaryWithContentsOfFile:delegate.path1]==nil)
        {delegate.dic=[NSMutableDictionary dictionaryWithContentsOfFile:delegate.path];
            //NSUserDefaults *user= [NSUserDefaults standardUserDefaults];
            
            [delegate.dic writeToFile:delegate.path1 atomically:YES];}
        else
        {  delegate.dic=[NSMutableDictionary dictionaryWithContentsOfFile:delegate.path1];}

    }
    return self;
}

@end
