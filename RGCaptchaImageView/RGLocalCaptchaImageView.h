//
//  CaptchaImageView.h
//  SmartCity
//
//  Created by Raykle on 14-3-13.
//  Copyright (c) 2014年 sea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGLocalCaptchaImageView : UIImageView

@property (nonatomic, assign) BOOL allowTapReload;
@property (strong, nonatomic, readonly) NSString *captchaString;

- (void)showCaptcha;

@end
