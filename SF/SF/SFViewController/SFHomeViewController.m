//
//  SFHomeViewController.m
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFHomeViewController.h"

@interface SFHomeViewController()  <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITableView *todayTableView;
@property (nonatomic, strong) UITableView *tomorrowTableView;
@property (nonatomic, strong) UITableView *yesterdayTableView;

@end

@implementation SFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"今天";
    self.navigationItem.titleView = [self createNavTitleView];
    [self initScrollerView];
}

- (UIView *)createNavTitleView {
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.screenWidth/2, 44.0f)];
    navView.backgroundColor = [UIColor greenColor];
    return navView;
}

- (void)initScrollerView {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentSize = CGSizeMake(self.screenWidth*3, self.contentHeight);
    _scrollView.pagingEnabled = true;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.showsVerticalScrollIndicator = false;
    [self.view addSubview:_scrollView];
    [self initTableView];
    [self.scrollView addSubview:_yesterdayTableView];
    [self.scrollView addSubview:_todayTableView];
    [self.scrollView addSubview:_tomorrowTableView];
}

#pragma -mark -
#pragma -mark -tableView

- (void)initTableView {
    _todayTableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(self.screenWidth, 0, self.screenWidth, self.contentHeight)];
    _tomorrowTableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(self.screenWidth*2, 0, self.screenWidth, self.contentHeight)];
    _yesterdayTableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(0, 0, self.screenWidth, self.contentHeight)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentify = @"today";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
