//
//  UpdateHeaderViewController.m
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/4.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "UpdateHeaderViewController.h"
#import <Photos/Photos.h>

@interface UpdateHeaderViewController ()

@end

static UpdateHeaderViewController *manager = nil;

@implementation UpdateHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (instancetype)sharedManger {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[UpdateHeaderViewController alloc] init];
        }
    });
    return manager;
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info { //UIImagePickerControllerMediaType,UIImagePickerControllerOriginalImage,UIImagePickerControllerReferenceURL
    NSString *mediaType = info[@"UIImagePickerControllerMediaType"];
    //判断是否为图片
    if ([mediaType isEqualToString:@"public.image"]) {
        
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        //通过判断picker的sourceType，如果是拍照则保存到相册去
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            [self save:image];
        }
    }
    //  else  如果是视频,没写
    [picker dismissViewControllerAnimated:YES completion:nil];
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
        NSLog(@"相册error == %@", error);
        NSLog(@"创建相册失败");
        return nil;
    } else {
        NSLog(@"创建相册成功");
    }
    
    //根据唯一标识创建相册
    return [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[creatCollectionID] options:nil].firstObject;
}
//保存照片
- (void)save:(UIImage *)image {
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
