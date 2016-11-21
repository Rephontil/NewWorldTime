//
//  ZYHomeTableViewController.m
//  NewWorldTime
//
//  Created by ZhouYong on 16/11/20.
//  Copyright © 2016年 ZhouYong. All rights reserved.
//

#import "ZYHomeTableViewController.h"
#import "ZYAssistantTableViewController.h"
#import "ZYTitleButton.h"
#import "ZYCover.h"
#import "ZYPopMenu.h"

@interface ZYHomeTableViewController ()<ZYCoverDelegate>
@property(nonatomic, weak)ZYTitleButton* titleButton;
@property(nonatomic, strong)ZYAssistantTableViewController* assistantTBVC;


@end

@implementation ZYHomeTableViewController

static NSString * const reuseHomeTableViewCellID = @"cell";


- (ZYAssistantTableViewController *)assistantTBVC
{
    if (_assistantTBVC == nil) {
        _assistantTBVC = [[ZYAssistantTableViewController alloc] init];
    }
    return _assistantTBVC;
}


// UIBarButtonItem:决定导航条上按钮的内容
// UINavigationItem:决定导航条上内容
// UITabBarItem:决定tabBar上按钮的内容
// ios7之后，会把tabBar上和导航条上的按钮渲染
// 导航条上自定义按钮的位置是由系统决定，尺寸才需要自己设置。

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];


}

- (void)setUpNavigationBar
{
    // 左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friendsearch) forControlEvents:UIControlEventTouchUpInside];

    // 右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];

    ZYTitleButton *titleButton = [ZYTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    [_titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    [_titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

    self.titleButton.adjustsImageWhenHighlighted = NO;
    _titleButton.adjustsImageWhenDisabled = NO;
    self.navigationItem.titleView = _titleButton;

}

- (void)friendsearch
{

}

- (void)pop
{


}

- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    // 弹出蒙板
    ZYCover *cover = [ZYCover show];
    cover.delegate = self;

    // 弹出pop菜单
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - 200) * 0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    ZYPopMenu *menu = [ZYPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.assistantTBVC.view;

}
- (void)coverDidClickCover:(ZYCover *)cover
{
    [ZYPopMenu hide];
    _titleButton.selected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseHomeTableViewCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseHomeTableViewCellID];
    }
    
    return cell;
}



@end
