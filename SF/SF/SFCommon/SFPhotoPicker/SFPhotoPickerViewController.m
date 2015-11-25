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

const NSString *photoSavedNotifiCation = @"photoSavedNotifiCation";

@interface SFPhotoPickerViewController ()<UITableViewDataSource, UITableViewDelegate,SFPhotoPickerCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *pickedPhotos;

@end

@implementation SFPhotoPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self rightNavItemWithName:@"保存"];
    self.tableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(0, self.navOffset, self.screenWidth, self.contentHeight)];
    [self.view addSubview:self.tableView];
    self.pickedPhotos = [[NSMutableArray alloc] init];
    
    NSLog(@"%@", [SFHelper timeStampOfNow]);
    
}

- (void)didClickOnRigthNavItem {
    [self popToViewControllerWithName:@"SFNewViewController"];
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
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
    for (int i=0; i<cellImageMaxCount; i++) {
        NSInteger index = indexPath.row*cellImageMaxCount+i;
        if(index < self.photoArray.count) {
            ALAsset *asset = [self.photoArray objectAtIndex:index];
            
            BOOL isPicked = false;
            for (int j=0; j<self.pickedPhotos.count; j++) {
                ALAsset *pickedAsset = (ALAsset *)[self.pickedPhotos objectAtIndex:j];
                if(pickedAsset == asset) {
                    isPicked = true;
                    break;
                }
            }
            UIImage *image = [UIImage imageWithCGImage:[asset thumbnail]];
            SFPhotoCellImageData *data = [[SFPhotoCellImageData alloc] initWithImage:image status:isPicked];
            [dataArray addObject:data];
//            [photoArray addObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]]];
            [indexArray addObject:[NSNumber numberWithInteger:index]];
        }
    }
    [cell cellContent:dataArray indexs:indexArray];
    return cell;
}
#pragma -mark -
#pragma -mark -SFPhotoPickerCellDelegate
//status YES:选中 NO:非选中
- (void)didClickOnImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status {
    if(status) {
        NSMutableArray *showPhotos = [[NSMutableArray alloc] init];
        for (NSInteger i=0; i<self.pickedPhotos.count; i++) {
            ALAsset *asset = [self.pickedPhotos objectAtIndex:i];
            [showPhotos addObject:[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]];
        }
        SFImageShowViewController *showVC = [[SFImageShowViewController alloc] init];
        showVC.imageArray = showPhotos;
        [self.navigationController pushViewController:showVC animated:YES];
    } else {
        ALAsset *asset = [self.photoArray objectAtIndex:aIndex];
        SFImageShowViewController *showVC = [[SFImageShowViewController alloc] init];
        showVC.imageArray = @[[UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]]];
        [self.navigationController pushViewController:showVC animated:YES];
    }
}

- (void)didPickImageWithIndex:(NSInteger)aIndex withStatus:(BOOL)status {
    ALAsset *asset = [self.photoArray objectAtIndex:aIndex];
    if(status) {
        [self.pickedPhotos addObject:asset];
    } else {
        [self.pickedPhotos removeObject:asset];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
