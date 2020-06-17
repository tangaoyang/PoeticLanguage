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
#import "PLKeyWordSearchDetailedViewController.h"
#import "PLPoetrySearchTableViewCell.h"
#import <Photos/Photos.h>
#import "ImageManager.h"
#import "ImageModel.h"
#import "AccessModel.h"
#import "PLPSCellButton.h"
#import "PLCollectManager.h"
#import "PLCollectModel.h"

@interface PLPoetrySearchMainViewController ()
<PLPSCellDelegate>
@end

@implementation PLPoetrySearchMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backImage = [[UIImage imageNamed:@"allBackgroundImage.jpg"]   imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];  //pl_pc_fly.jpg
    UIImageView *backImageView = [[UIImageView alloc] initWithImage:backImage];
    [self.view insertSubview:backImageView atIndex:0];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view.mas_width);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(0);
    }];
//    backImageView.alpha = 0.5;
    
    
    _myView = [[PLPoetrySearchMainView alloc] init];
    [self.view addSubview:_myView];
    _myView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [_myView.cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_myView.photoButton addTarget:self action:@selector(camera) forControlEvents:UIControlEventTouchUpInside];
    _myView.plpsCellDelegate = self;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpView:) name:@"search" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photo) name:@"photo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useCamera) name:@"camera" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showDetail:) name:@"poem" object:nil];
    
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

- (void)showDetail:(NSNotification *)keyword {
    
    NSDictionary *getDictionary = keyword.userInfo;
    PLKeywordSearchDetailedViewController *detail = [[PLKeywordSearchDetailedViewController alloc] init];
    detail.keyword = getDictionary[@"poem"];
    [self.navigationController pushViewController:detail animated:NO];
    
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
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"选择方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self useCamera];
    }];
    [camera setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:camera];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self photo];
    }];
    [photo setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:photo];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [alert addAction:cancel];
    [self presentViewController:alert animated:NO completion:nil];
    
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
        NSData *data = UIImageJPEGRepresentation(image, 1.0f);
        
        [ImageManager sharedManger].data = data;
        
        //通过判断picker的sourceType，如果是拍照则保存到相册去
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            [self save:image];
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
        if (list.age == NULL) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请选择含有人像的图片！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [self photo];
            }];
            [alert addAction:sureAction];
            [self presentViewController:alert animated:NO completion:nil];
        } else {
            NSLog(@"年龄为%@岁， 性别为%@的可能性是%@， 表情为%@的可能性是%@", list.age, list.gender.type, list.gender.probability, list.expression.type, list.expression.probability);
        }
    }];
    
}

#pragma mark - 保存照片
//获取相册
- (PHAssetCollection *)createdCollection {
    //获取APP名称
    NSString *title = [NSBundle mainBundle].infoDictionary[@"CFBundleName"];
    //抓取所有自定义相册
    PHFetchResult<PHAssetCollection*> *collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    //查找当前的app的自定义相册
    for (PHAssetCollection *collection in collections) {
        if ([collection.localizedTitle isEqualToString:title]) {
            return collection;
        }
    }
    //当前对象没有被创建过
    NSError *error = nil;
    __block  NSString *creatCollectionID = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        //创建一个自定义字典
        creatCollectionID = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection.localIdentifier;
    } error:&error];
    if (error) {
        NSLog(@"error == %@", error);
        NSLog(@"创建相册失败");
        return nil;
    } else {
        NSLog(@"创建相册成功");
    }
    
    //根据唯一标识创建相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[creatCollectionID] options:nil].firstObject;
}
//保存照片
-(void)save:(UIImage *)image {
    
    //保存函数到相机胶卷
    // 同步
    __block PHObjectPlaceholder *placeholder = nil;
    NSError *error = nil;
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        placeholder = [PHAssetChangeRequest creationRequestForAssetFromImage:image].placeholderForCreatedAsset;
    } error:&error];
    if (error) {
        NSLog(@"保存失败");
    } else {
        NSLog(@"保存成功");
    }
    //获得相册
    PHAssetCollection *createdCollection = [self createdCollection];
    //添加图片到指定相册
    //    PHAsset : 一个PHAsset对象就代表相册中的一张图片或者一个视频
    //    PHAssetCollection : 一个PHAssetCollection 对象就代表一个相册
    //    凡是涉及增删改的操作，均需要放在performChanges里面执行。
    [[PHPhotoLibrary sharedPhotoLibrary] performChangesAndWait:^{
        PHAssetCollectionChangeRequest *request =  [PHAssetCollectionChangeRequest changeRequestForAssetCollection:createdCollection];
        [request insertAssets:@[placeholder] atIndexes:[NSIndexSet indexSetWithIndex:0]];
    } error:&error];
}

#pragma mark - 收藏
- (void)passButton:(PLPSCellButton *)button {
//    [PLCollectManager sharedManager] collectMessage:^(PLCollectModel * _Nullable collectModel) {
//        if (collectModel.msg == @"ok") {
//            <#statements#>
//        }
//    } error:^(NSError * _Nullable error) {
//        NSLog(@"collect error == %@", error);
//    } id:<#(nonnull NSString *)#>
    if(button.selected == NO) {
        button.selected = YES;
        [button.buttonImageView setImage:[[UIImage imageNamed:@"pl_ps_collected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        button.buttonLabel.text = @"已收藏";
    } else {
        button.selected = NO;
        [button.buttonImageView setImage:[[UIImage imageNamed:@"pl_ps_uncollect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        button.buttonLabel.text = @"收藏";
    }
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
