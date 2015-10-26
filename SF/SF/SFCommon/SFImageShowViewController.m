//
//  SFImageShowViewController.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFImageShowViewController.h"
#import "SFClickImageView.h"

@interface SFImageShowViewController () <UIScrollViewDelegate>{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    BOOL _isHiddenNav;
}
@end

@implementation SFImageShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isHiddenNav = false;
    [self initContentViews];
}

- (void)initContentViews {
    NSInteger pagCount = self.imageArray.count;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.statusBarOffset, self.screenWidth, self.view.height)];
    _scrollView.contentSize = CGSizeMake(self.screenWidth*pagCount, self.contentHeight);
    _scrollView.pagingEnabled = true;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = false;
    _scrollView.showsVerticalScrollIndicator = false;
    [self.view addSubview:_scrollView];
    
    for(NSInteger i=0; i<pagCount; i++) {
        SFClickImageView *imageView = [[SFClickImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [self.imageArray objectAtIndex:i];
        [imageView addTarget:self selector:@selector(didClickOnImage:)];
        imageView.frame = CGRectMake(_scrollView.width*i, 0, self.view.width, self.view.height);
        [_scrollView addSubview:imageView];
    }
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.backgroundColor=[UIColor clearColor];
    [_pageControl setBounds:CGRectMake(0, 0, 200, 100)];
    [_pageControl setCenter:CGPointMake(self.screenWidth/2,self.screenHeight-50)];
    _pageControl.numberOfPages = pagCount;
    _pageControl.currentPage = 0;
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor orangeColor]];
    [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    [_pageControl addTarget:self action:@selector(switchPage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
}

- (void)switchPage:(id)sender {
    UIPageControl *currentControl=(UIPageControl *)sender;
    NSInteger currentPage=currentControl.currentPage;
    [_scrollView setContentOffset:CGPointMake(currentPage*self.view.bounds.size.width, 0)] ;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentPage=scrollView.contentOffset.x/self.view.bounds.size.width;
    [_pageControl setCurrentPage:currentPage];
}

- (void)didClickOnImage:(id)sender {
    _isHiddenNav = !_isHiddenNav;
    [super.navigationController setNavigationBarHidden:_isHiddenNav animated:YES];
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
