//
//  UpdateHeaderViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/5/4.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UpdateHeaderViewController : UIViewController


+ (instancetype)sharedManger;
- (void)useCamera;
- (void)photo;
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
- (void)save:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
