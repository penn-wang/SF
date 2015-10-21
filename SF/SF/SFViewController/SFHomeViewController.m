//
//  SFHomeViewController.m
//  SF
//
//  Created by penn on 15/10/20.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFHomeViewController.h"
#import "SFNavTitleView.h"
#import "SFNewViewController.h"

@interface SFHomeViewController()  <UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate
,SFNavTitleViewDelegate>

@property (nonatomic, strong) SFNavTitleView *navTitleView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITableView *todayTableView;
@property (nonatomic, strong) UITableView *tomorrowTableView;
@property (nonatomic, strong) UITableView *yesterdayTableView;

@end

@implementation SFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavTitleView];
    [self initScrollerView];
}

- (void)initNavTitleView {
    _navTitleView = [[SFNavTitleView alloc] initWithFrame:CGRectMake(0, 0, self.screenWidth/2, 44)];
    _navTitleView.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_navTitleView];
    [self rightNavItemSet];
}

- (void)didClickOnRigthNavItem {
    SFNewViewController *vc = [[SFNewViewController alloc] init];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navVC animated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)initScrollerView {
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.navOffset, self.screenWidth, self.contentHeight)];
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
    
    [self scrollToPage:self.navTitleView.curPage animated:NO];
}

#pragma -mark -
#pragma -mark -navTitleView
- (void)navTitleDidToPage:(NSInteger)page {
    switch (page) {
        case 0:
            [self scrollToPage:0 animated:YES];
            break;
        case 1:
            [self scrollToPage:1 animated:YES];
            break;
        case 2:
            [self scrollToPage:2 animated:YES];
            break;
        default:
            break;
    }
}

#pragma -mark -
#pragma -mark -navTitleView

- (void)scrollToPage:(NSInteger)aPage animated:(BOOL)animated{

    CGFloat offsetY = self.scrollView.contentOffset.y;
    [self.scrollView setContentOffset:CGPointMake(aPage*self.screenWidth, offsetY) animated:animated];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    NSInteger scrollPage = offsetX / self.screenWidth;
    self.navTitleView.curPage = scrollPage;
    [self.navTitleView resetButtonsByCurPage];
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
