//
//  ViewController.m
//  MasonryDemo
//
//  Created by 小飞鸟 on 2018/1/20.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * label = [[UIButton alloc]init];
    [label setTitle:@"￥200元" forState:UIControlStateNormal];
    label.titleLabel.font = [UIFont systemFontOfSize:36];
    label.backgroundColor = [UIColor greenColor];
    [label.titleLabel sizeToFit];
    [label setTitleEdgeInsets:UIEdgeInsetsMake(12, 0, 0, 0)];
    [self.view addSubview:label];

    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).mas_offset(30);
        make.left.equalTo(self.view).mas_offset(50);
//        make.height.mas_equalTo([label.text sizeWithAttributes:@{NSFontAttributeName:label.font}].height);
    }];
    
    UILabel * label2 = [[UILabel alloc]init];
    label2.text = @"下输入的东西";
    label2.backgroundColor = [UIColor greenColor];
    //    label.preferredMaxLayoutWidth =150;
    //    label.numberOfLines = 0;
    //    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.view addSubview:label2];
    label2.shadowColor=[UIColor blueColor];
    label2.shadowOffset=CGSizeMake(0, 5);
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).mas_offset(50);
        make.bottom.equalTo(label).mas_offset(0);
    }];
    
    
    /*设置 尺寸Size  和 center*/
    UIView * view1 =[UIView new];
    view1.backgroundColor=[UIColor redColor];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        //等价
        make.center.mas_equalTo(self.view);
    }];
    
    
    //设置四周的边距
    UIView * view2 =[UIView new];
    view2.backgroundColor=[UIColor greenColor];
    [view1 addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1).with.offset(10);
        make.top.equalTo(view1).with.offset(10);
        make.right.equalTo(view1).with.offset(-10);
        make.bottom.equalTo(view1).with.offset(-10);
    }];
    
    //View2上的两个视图 宽度相等 View3 View4 间距和 View3与View4 和View2之间的间距相等-》10
    UIView * view3 =[UIView new];
    view3.backgroundColor=[UIColor yellowColor];
    [view2 addSubview:view3];
    
    UIView * view4 =[UIView new];
    view4.backgroundColor=[UIColor darkGrayColor];
    [view2 addSubview:view4];

    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {

//        make.left.equalTo(view2.mas_left).with.offset(10);
//        make.left.mas_equalTo(view2.mas_left).with.offset(10);
//        make.left.equalTo(view2).with.offset(10);
        make.left.equalTo(@10);
        make.left.mas_equalTo(10);
//        make.left.equalTo(view2).offset(10);
        make.center.mas_equalTo(CGPointMake(10, 10));
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.top.equalTo(view2.mas_top).with.offset(0);
        make.right.equalTo(view4.mas_left).with.offset(-10);
        make.width.equalTo(view4.mas_width);
        make.height.equalTo(view2);
    }];

    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(view3.mas_right).with.offset(10);
        make.right.equalTo(view2.mas_right).with.offset(-10);
        make.width.equalTo(view3.mas_width);
        make.top.equalTo(view3.mas_top);
        make.height.equalTo(view3);
    }];
    
    
}

-(void)exp3{
    UIView *view1 = [UIView new];
    [view1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:view1];
    UIView *view2 = [UIView new];
    [view2 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:view2];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(view2.mas_width);
        make.left.mas_equalTo(self.view.mas_left).with.offset(10);
        make.right.mas_equalTo(view2.mas_left).offset(-10);
    }];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(view1.mas_width);
        make.left.mas_equalTo(view1.mas_right).with.offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
    }];
}


@end
