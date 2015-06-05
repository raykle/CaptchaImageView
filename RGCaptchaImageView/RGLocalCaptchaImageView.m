//
//  CaptchaImageView.m
//  SmartCity
//
//  Created by Raykle on 14-3-13.
//  Copyright (c) 2014年 sea. All rights reserved.
//

#import "RGLocalCaptchaImageView.h"

@implementation RGLocalCaptchaImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        CGRect rect = frame;
//        rect.size.width = 114;
//        rect.size.height = 30;
//        self.frame = rect;
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib{
    [self setUp];
    [self showCaptcha];
}

- (void)setUp{
    self.backgroundColor = [UIColor colorWithRed:238/255.0 green:249/255.0 blue:253/255.0 alpha:1.0];
    self.userInteractionEnabled = YES;
}

#pragma mark -
- (void)setAllowTapReload:(BOOL)allowTapReload{
    _allowTapReload = allowTapReload;
    if (allowTapReload) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reloadCaptcha:)];
        [self addGestureRecognizer:tap];
    }
}

- (void)reloadCaptcha:(UIGestureRecognizer *)gesture{
    [self showCaptcha];
}

#pragma mark - Draw Captcha
- (void)showCaptcha
{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.0;
    
    NSArray *array = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                       @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J",
                       @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T",
                       @"U", @"V", @"W", @"X", @"Y", @"Z"];
//    NSArray *array = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    
    UIImage *aLayoutImage;
    self.image = nil;
    UIGraphicsBeginImageContext(self.frame.size);
    for (int i = 0; i < 4; i++){
        NSString *str1 = array[arc4random() % array.count];
        
        if (i == 0){
            _captchaString = str1;
        }
        else{
            _captchaString = [_captchaString stringByAppendingString:str1];
        }
        
        int red = arc4random() % 255;
        int green = arc4random() % 255;
        int blue = arc4random() % 255;
        float alpha = 1.0;
        
        UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
        
        int oriX = arc4random() % MAX(0, ((int)(self.bounds.size.width / 4)) - 14);
        int oriY = arc4random() % 10;
        float width = 40.0;
        float height = 40.0;
        
        CGRect frame = CGRectMake(oriX + i * (self.bounds.size.width / 4), oriY, width, height);
        
        float random = (arc4random() % 1800)/1000.0;
        if (i == 0){
            random = MAX(random, 1);
        }
        
        NSNumber *obliqueness = [NSNumber numberWithFloat:(random - 1)];
        [str1 drawInRect:frame withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:28], NSForegroundColorAttributeName:color, NSObliquenessAttributeName:obliqueness}];
    }
    
    
    //干扰线
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineWidth = 1.5f;
    CGContextSetLineWidth(context, lineWidth);
    
    
    for (int j = 0; j < 3; j++){
        int pointX1 = arc4random() % (int)self.bounds.size.width;
        int pointY1 = arc4random() % (int)self.bounds.size.height;
        
        CGPoint point1 = CGPointMake(pointX1, pointY1);
        
        int pointX2 = arc4random() % (int)self.bounds.size.width;
        int pointY2 = arc4random() % (int)self.bounds.size.height;
        
        CGPoint point2 = CGPointMake(pointX2, pointY2);
        
        
        int red = arc4random() % 255;
        int green = arc4random() % 255;
        int blue = arc4random() % 255;
        float alpha = 1.0;
        
        UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
        
        CGColorRef lineColorRef = color.CGColor;
        CGContextSetStrokeColorWithColor(context, lineColorRef);
        
        CGContextMoveToPoint(context, point1.x, point1.y);
        CGContextAddLineToPoint(context, point2.x, point2.y);
        CGContextStrokePath(context);
    }
    
    
    aLayoutImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = aLayoutImage;
}

@end
