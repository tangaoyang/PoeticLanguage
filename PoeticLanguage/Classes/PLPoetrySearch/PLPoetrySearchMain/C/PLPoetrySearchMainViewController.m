//
//  PLPoetrySearchMainViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/1/17.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "PLPoetrySearchMainViewController.h"
#import "PLPoetrySearchMainView.h"
#import "Masonry.h"
#import "PLKeywordSearchViewController.h"
#import "PLPhotoRecogitionView.h"
#import <Photos/Photos.h>
#import "ImageManager.h"
#import "ImageModel.h"
#import "AccessModel.h"

@interface PLPoetrySearchMainViewController ()

@end

@implementation PLPoetrySearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [[UIImage imageNamed:@"pl_ps_background_knot.jpeg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    backImageView.frame = self.view.bounds;
    backImageView.alpha = 0.5;
    [self.view insertSubview:backImageView atIndex:0];
    
    _myView = [[PLPoetrySearchMainView alloc] init];
    [self.view addSubview:_myView];
    _myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_myView.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_myView.photoButton addTarget:self action:@selector(camera) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"search" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photo) name:@"photo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useCamera) name:@"camera" object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.topItem.title = @"";
    self.tabBarController.tabBar.hidden = NO;
    
    [_myView.searchTextField endEditing:YES];
    _myView.searchTextField.text = @"";
    [_myView.searchTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width).offset(-70);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _myView.photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.view.mas_top).offset(40);
    }];
    [_myView.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(0));
        make.top.and.bottom.equalTo(@(0));
    }];
}

- (void)jumpView:(NSNotification *)keyword {
    
    NSDictionary *getDictionary = keyword.userInfo;
    PLKeywordSearchViewController *search = [[PLKeywordSearchViewController alloc] init];
    search.keyword = getDictionary[@"key"];
    [self.navigationController pushViewController:search animated:NO];
}

- (void)cancel {
    
    _myView.searchTextField.text = @"";
    [_myView.searchTextField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width).offset(-70);
        make.height.mas_equalTo(@(40));
        make.left.mas_equalTo(self -> _myView.photoButton.mas_right).offset(5);
        make.top.mas_equalTo(self.view.mas_top).offset(40);
    }];
    [_myView.searchTextField endEditing:YES];
    [_myView.cancelButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@(0));
        make.top.and.bottom.equalTo(@(0));
    }];
    
}

#pragma mark - 弹出使用接口
- (void)camera {
    PLPhotoRecogitionView *photoRecogitionView = [[PLPhotoRecogitionView alloc] init];
    [self.view addSubview:photoRecogitionView];
    photoRecogitionView.frame = self.view.bounds;
    
    //提前请求access_token
    [[ImageManager sharedManger] getAccess:^(AccessModel * _Nonnull AccessModel) {
        self.access_token = AccessModel.access_token;
        NSLog(@"self.access_token == %@", self.access_token);
    } error:^(NSError * _Nonnull error) {
        NSLog(@"error == %@", error);
    }];
    
    [self addObserver:[ImageManager sharedManger] forKeyPath:@"access_token" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - 使用相机
- (void)useCamera {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *pickController = [[UIImagePickerController alloc] init];
        pickController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        pickController.mediaTypes = @[@"public.image"];
        pickController.delegate = self;
        //设置闪光灯模式
        pickController.cameraFlashMode = UIImagePickerControllerCameraFlashModeAuto;
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //相册访问权限
            if (status == PHAuthorizationStatusAuthorized) {
                NSLog(@"Authorized");
            }else{
                NSLog(@"Denied or Restricted");
            }
        }];
        [self presentViewController:pickController animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无可用摄像头" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sure];
        [self presentViewController:alert animated:NO completion:nil];
    }
}

#pragma mark - 访问相册
- (void)photo {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - 协议方法的实现
//协议方法，选择完毕以后，开始人脸识别
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSLog(@"%@",info);  //UIImagePickerControllerMediaType,UIImagePickerControllerOriginalImage,UIImagePickerControllerReferenceURL
    NSString *mediaType = info[@"UIImagePickerControllerMediaType"];
    if ([mediaType isEqualToString:@"public.image"]) {  //判断是否为图片
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.showImageView = [[UIImageView alloc] init];
        [_showImageView setImage:image];
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        
        [ImageManager sharedManger].data = data;
        
        //通过判断picker的sourceType，如果是拍照则保存到相册去
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
        
        if ([ImageManager sharedManger].access) {
            [self faceRecognition];
        }
    }
    //  else  如果是视频,没写
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 人脸识别
- (void)faceRecognition {
    
    [[ImageManager sharedManger] identification:^(ImageModel *resultImageModel) {
        ImageModel *model = [[ImageModel alloc] init];
        model = resultImageModel;
        ListModel *list = [[ListModel alloc] init];
        list = model.result.face_list[0];
        NSLog(@"年龄为%@岁， 性别为%@的可能性是%@， 表情为%@的可能性是%@", list.age, list.gender.type, list.gender.probability, list.expression.type, list.expression.probability);
    }];
    
}

#pragma mark - 保存照片
//此方法就在UIImageWriteToSavedPhotosAlbum的上方
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"已保存");
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
