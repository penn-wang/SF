//
//  SFNewMemoViewController.m
//  SF
//
//  Created by penn on 15/10/21.
//  Copyright © 2015年 SF. All rights reserved.
//

#import "SFNewMemoViewController.h"
#import "SFPhotoGroupViewController.h"
#import "SFTextView.h"
#import "SFPhotoPickedView.h"
#import "SFPhotoData.h"
#import "SFPhotoSaver.h"

@interface SFNewMemoViewController ()<UITextViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, SFPhotoPickedViewDelegate>

@property (nonatomic, strong) SFTextView *textView;
@property (nonatomic, strong) SFPhotoPickedView *pickedViews;
@property (nonatomic, assign) BOOL isNeedLoadView;


@end

@implementation SFNewMemoViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftNavItemCancel];
    [self rightNavItemWithName:@"保存"];
    [self addNotification];
    [SFSettings sharedSettings].photoCapacity = 5;
    self.textView = [[SFTextView alloc] initWithFrame:CGRectMake(10, self.navOffset+10, self.screenWidth-20, 100) placeHolder:@"请输入内容"];
    self.textView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.textView];
    
    self.pickedViews = [[SFPhotoPickedView alloc] initWithOriginY:self.textView.bottom+20];
    self.pickedViews.backgroundColor = [UIColor grayColor];
    self.pickedViews.delegate = self;
    [self.view addSubview:self.pickedViews];
    
}

- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotifySavedPhoto:) name:SFNotification_Did_SavePhoto object:nil];
}

- (void)didNotifySavedPhoto:(NSNotification *)notification {
    NSArray *receiveObj = (NSArray *)[notification object];
    [self.pickedViews addPhotoImageViews:receiveObj];
}

- (void)didClickOnLeftNavItem {
    if([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didClickOnRigthNavItem {
//    [[SFPhotoSaver sharedPhotoSaver] savePhoto:nil];
}

#pragma -mark -
#pragma -mark -xiangce

//开始拍照
-(void)takePhoto {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:^{
        
    }];
}

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"info : %@", info.description);
    
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"]) {
        //先把图片转成NSData
        UIImage* image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else {
            data = UIImagePNGRepresentation(image);
        }
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        //得到选择后沙盒中图片的完整路径
//        NSString *filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
        //创建一个选择后图片的小图标放在下方
        //类似微薄选择图后的效果
        UIImageView *smallimage = [[UIImageView alloc] initWithFrame:
                                    CGRectMake(50, 300, 200, 200)] ;
        
        smallimage.image = image;
        //加在视图中
        [self.view addSubview:smallimage];
    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"您取消了选择图片");
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma -mark -
#pragma -mark -SFPhotoPickedViewDelegate

- (void)shouldAddPhotos {
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    //添加Button
    [alertController addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //处理点击拍照
        [self takePhoto];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"从相册选取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        //        [self LocalPhoto];
        SFPhotoGroupViewController *photoGroup = [[SFPhotoGroupViewController alloc] init];
        [self.navigationController pushViewController:photoGroup animated:YES];
    }]];
    [alertController addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController: alertController animated: YES completion: nil];
}

- (void)shouldShowPhotos:(NSArray *)dataArray index:(NSInteger)aIndex {
    
}


@end
