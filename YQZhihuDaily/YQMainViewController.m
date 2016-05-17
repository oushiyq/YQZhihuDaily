//
//  YQMainViewController.m
//  YQZhihuDaily
//
//  Created by 羊琪 on 16/5/4.
//  Copyright © 2016年 user. All rights reserved.
//

#import "YQMainViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "YQLoadNews.h"
#import "ArrayDataSource.h"
#import "HomeCell.h"

static NSString * const homeCellIdentifier = @"HomeCell";


@interface YQMainViewController ()<UITableViewDelegate,HomeCellDelegate>

//ui
@property (strong, nonatomic) UIButton *leftBuntton;
@property (strong, nonatomic) UIView *naviBar;
@property (strong, nonatomic) UILabel *mainTitle;
@property (strong, nonatomic) UITableView *tableView;

//data
@property (strong, nonatomic) YQLoadNews *news;
@property (strong ,nonatomic) NSMutableArray *stories;
@property (strong ,nonatomic) ArrayDataSource *dataSource;
//@property (strong, nonatomic)

@end

@implementation YQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //subview
   
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.leftBuntton];
    [self.view addSubview:self.mainTitle];
    
    
    [self.news loadNewStoriesWithCallback:^(id obj) {
        [self setupTableViewWithArray:obj];
    }];
    
    
}


//tableView
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 55, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)
                                                 style:UITableViewStylePlain];
        //TODO headView
        _tableView.delegate = self;
        _tableView.rowHeight = 90;
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    return _tableView;
}



// tableView datasource


- (void)setupTableViewWithArray:(id)obj{
    self.stories = obj;
    //头部新闻
    [self setupTableView];
    [self.view addSubview:self.tableView];
}

//设置今日热闻
- (void)setupTableView{
        self.dataSource = [[ArrayDataSource alloc]initWithItems:self.stories cellIdentifier:homeCellIdentifier configureCellBlock:^(HomeCell *cell,YQStoriesTool *story){
        cell.YQStoriesTool = story;
        cell.delegate = self;
    }];
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil]
         forCellReuseIdentifier:homeCellIdentifier];
    
}

//下拉刷新以前的新闻
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offSetY = scrollView.contentOffset.y;
    if (offSetY > scrollView.contentSize.height - 2 * ([UIScreen mainScreen].bounds.size.height)) {
        [_news loadFormerStoriesWithUpdateFormer:^{
            
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:self.stories.count - 1]
                          withRowAnimation:UITableViewRowAnimationFade];
        }];
    }
}


// news
- (YQLoadNews *)news{
    if (!_news) {
        _news = [[YQLoadNews alloc]init];
    }
    return _news;
}

// leftButon
- (void)openDrawer{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (UIButton *)leftBuntton{
    if (!_leftBuntton) {
        _leftBuntton = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 30, 30)];
        [_leftBuntton addTarget:self
                         action:@selector(openLeftDrawer)
               forControlEvents:UIControlEventTouchUpInside];
        
        
        [_leftBuntton setImage:[UIImage imageNamed:@"Home_Icon" ]
                      forState:UIControlStateNormal];
        
    }
    return _leftBuntton;
}


- (void)openLeftDrawer{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                      animated:YES
                                    completion:nil];
}

//naviBar
- (UIView *)naviBar{
    if (!_naviBar) {
        _naviBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 55)];
        _naviBar.backgroundColor = YQColor(23, 144, 211, 1);
//        _naviBar.alpha = 0;
    }
    return _naviBar;
}

//mainTitle
- (UILabel *)mainTitle{
    if (!_mainTitle) {
        _mainTitle = [[UILabel alloc]init];
        _mainTitle.attributedText = [[NSAttributedString alloc]initWithString:@"今日热闻"
                                                                   attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor],NSStrokeColorAttributeName:[UIColor blackColor]}];
        [_mainTitle sizeToFit];
        CGPoint center = self.view.center;
        center.y = 35;
        center.x = self.view.center.x;
        _mainTitle.center = center;
        
        
    }
    
    return _mainTitle;
}



//headView


@end
