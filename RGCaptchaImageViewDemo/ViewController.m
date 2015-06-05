//
//  ViewController.m
//  RGCaptchaImageViewDemo
//
//  Created by Ray on 14/6/5.
//  Copyright (c) 2014年 Ray. All rights reserved.
//

#import "ViewController.h"
#import "RGLocalCaptchaImageView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet RGLocalCaptchaImageView *captchaImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _captchaImageView.allowTapReload = YES;
    NSLog(@"%@", _captchaImageView.captchaString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reloadAction{
    [_captchaImageView showCaptcha];
    NSLog(@"%@", _captchaImageView.captchaString);
}

@end
