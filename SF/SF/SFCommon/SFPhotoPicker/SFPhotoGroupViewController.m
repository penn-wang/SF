//
//  SFPhotoGroupViewController.m
//  SF
//
//  Created by penn on 15/10/22.
//  Copyright © 2015年 SF. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>
#import "SFPhotoGroupViewController.h"
#import "SFPhotoGroupCell.h"

#import "SFPhotoPickerViewController.h"


@interface SFPhotoGroupViewController () <UITableViewDataSource, UITableViewDelegate>{
    ALAssetsLibrary *_assetsLibrary;
}

@property (nonatomic, strong) NSMutableArray *groupArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SFPhotoGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initContentViews];
}

- (void)initData {
    _assetsLibrary = [[ALAssetsLibrary alloc] init];
    self.groupArray = [[NSMutableArray alloc] init];
    [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group) {
            [self.groupArray addObject:group];
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self initContentViews];
            });
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"error");
    }];
}

- (void)initContentViews {
    self.tableView = [SFUICreator SFCommonTableView:self frame:CGRectMake(0, self.navOffset, self.screenWidth, self.contentHeight)];
    [self.view addSubview:self.tableView];
}

-(void)didi {
    NSLog(@"%@",self.groupArray.description);
}

#pragma -mark -
#pragma -mark -table
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.groupArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseStr = @"photoGroupReuse";
    SFPhotoGroupCell *cell = (SFPhotoGroupCell *)[tableView dequeueReusableCellWithIdentifier:reuseStr];
    if(cell == nil) {
        cell = [[SFPhotoGroupCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseStr];
    }
    ALAssetsGroup *group = [self.groupArray objectAtIndex:indexPath.row];
    
    [cell cellContent:[UIImage imageWithCGImage:group.posterImage]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    ALAssetsGroup *group = [self.groupArray objectAtIndex:indexPath.row];
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            if([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [photos addObject:result]; //过滤相册中的视频
            }
        }
    }];
    SFPhotoPickerViewController *photoPikcer = [[SFPhotoPickerViewController alloc] init];
    photoPikcer.photoArray = photos;
    [self.navigationController pushViewController:photoPikcer animated:YES];
    
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
