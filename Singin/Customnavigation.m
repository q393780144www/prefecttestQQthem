//
//  Customnavigation.m
//  Singin
//
//  Created by mac on 14-9-26.
//  Copyright (c) 2014年 ___YUGUIHUA___. All rights reserved.
//

#import "Customnavigation.h"

@implementation Customnavigation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+(Customnavigation *)creatcustomnavigition
{
    Customnavigation *custom=[[NSBundle mainBundle]loadNibNamed:@"Navigation" owner:nil options:nil][0];
    return custom;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)button:(UIButton *)sender {
}
@end
