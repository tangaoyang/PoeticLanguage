//
//  PLFaceRecogitionViewController.h
//  PoeticLanguage
//
//  Created by cinderella on 2020/7/21.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class PLFaceRecognitionView;
@class PLFaceRecognitionModel;

@interface PLFaceRecogitionViewController : UIViewController

@property (nonatomic, strong) PLFaceRecognitionView *myView;
@property (nonatomic, strong) PLFaceRecognitionModel *myModel;

@end

NS_ASSUME_NONNULL_END
