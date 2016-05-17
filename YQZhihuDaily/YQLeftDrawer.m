//
//  YQLeftDrawer.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/3.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQLeftDrawer.h"
#import "YQThemeViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "YQThemesTool.h"


@interface YQLeftDrawer()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *listData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *themes;


@end

@implementation YQLeftDrawer

- (void)viewDidLoad{
    NSMutableArray *myTheme = [[NSMutableArray alloc]init];
    [YQThemesTool getThemesWithSuccessfulBlock:^(id obj){
        //themes的作用域在block中
        [self.themes addObjectsFromArray:obj];
        Theme *theme = [[Theme alloc]init];
        for (id obj in self.themes){
            theme = obj;
            [myTheme addObject:theme.name];
        }
        [self setupUI];
    }];
    self.listData = myTheme;

}


- (NSMutableArray *)themes{
    if (_themes == nil) {
        _themes = [NSMutableArray array];
        Theme *theme = [[Theme alloc] init];
        theme.name =  @"首页";
        [_themes addObject:theme];
    }
    return _themes;
}

- (void)setupUI{
    //tableview
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = YQColor(26, 31, 36, 1.0);
    
    //background
    self.view.backgroundColor = YQColor(26, 31, 36, 1.0);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"leftDrawerCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //设置cell属性
    cell.backgroundColor = YQColor(26, 31, 36, 1.0);
    NSInteger row = [indexPath row];
    cell.textLabel.text = [self.listData objectAtIndex:row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    YQThemeViewController *themeViewController = [[YQThemeViewController alloc]init];
    themeViewController.title = [self.listData objectAtIndex:[indexPath row]];
    UINavigationController *themeNavViewController = (UINavigationController *)self.mm_drawerController.centerViewController;
    
    
    //进入首页/主题界面
    if ([indexPath row] == 0) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }else{
        [themeNavViewController pushViewController:themeViewController animated:YES];
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
    
}



@end
