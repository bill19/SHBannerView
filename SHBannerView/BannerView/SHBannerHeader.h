//
//  SHBannerHeader.h
//  SHBannerView
//
//  Created by sunhao on 2018/12/4.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#ifndef SHBannerHeader_h
#define SHBannerHeader_h

#define kBannerView_H kBannerScreenWidth * 0.75
#define kBannerScreenWidth [UIScreen mainScreen].bounds.size.width
#define kBannerScreenHeight [UIScreen mainScreen].bounds.size.height
#define SafeAreaTopHeight (kBannerScreenHeight == 812.0 ? 88 : 64)
#define kBannerPageControlHeight 40.0f
#define kBannerStatuBarHeight (kBannerScreenHeight == 812.0 ? 44 : 20)
static NSString * kBannerReuseIdentifier = @"SHBannerCell";
static NSInteger kBannerTimes = 500;
#endif /* SHBannerHeader_h */
