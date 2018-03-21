//
//  SHBannerView.h
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBannerModel.h"

#define kBannerView_H kBannerScreenWidth * 0.75
#define kBannerScreenWidth [UIScreen mainScreen].bounds.size.width
#define kBannerScreenHeight [UIScreen mainScreen].bounds.size.height
#define SafeAreaTopHeight (kBannerScreenHeight == 812.0 ? 88 : 64)
#define kBannerPageControlHeight 40.0f
#define kBannerStatuBarHeight (kBannerScreenHeight == 812.0 ? 44 : 20)
static NSString * kBannerReuseIdentifier = @"SHBannerCell";

@interface SHBannerView : UIScrollView

- (void)bannerUpdateSourec:(NSArray <SHBannerModel *>*)bannerModels;

@end
