//
//  SFPhotoPickerViewController.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "SFPhotoPickerViewController.h"
#import "SFPhotoPickerCell.h"
#import "SFImageShowViewController.h"

@interface SFPhotoPickerViewController ()<UITableViewDataSource, UITableViewDelegate,SFPhotoPickerCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SFPhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rightNavItemWithName:@"预览"];
    self.tableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(0, self.navOffset, self.screenWidth, self.contentHeight)];
    [self.view addSubview:self.tableView];
}

- (void)didClickOnRigthNavItem {
    SFImageShowViewController *imageVC = [[SFImageShowViewController alloc] init];
    [self.navigationController pushViewController:imageVC animated:YES];
}

#pragma -mark -
#pragma -mark -tableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [SFPhotoPickerCell cellHeight];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photoArray.count%cellImageMaxCount==0?(self.photoArray.count/cellImageMaxCount):(self.photoArray.count/cellImageMaxCount+1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseStr = @"SFPhotoPickerCell";
    SFPhotoPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseStr];
    if(cell==nil) {
        cell = [[SFPhotoPickerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseStr];
        cell.delegate = self;
    }
    NSMutableArray *photoArray = [[NSMutableArray alloc] init];
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    for (int i=0; i<cellImageMaxCount; i++) {
        NSInteger index = indexPath.row*4+i;
        if(index < self.photoArray.count) {
            ALAsset *asset = [self.photoArray objectAtIndex:index];
            [photoArray addObject:[UIImage imageWithCGImage:[asset thumbnail]]];
//            [photoArray addObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]]];
            [indexArray addObject:[NSNumber numberWithInteger:index]];
        }
    }
    [cell cellContent:photoArray indexs:indexArray];
    return cell;
}
#pragma -mark -
#pragma -mark -SFPhotoPickerCellDelegate
- (void)didClickOnImageWithIndex:(NSInteger)aIndex {
    
}

- (void)didPickImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status {
    //status YES:选中 NO:非选中
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
