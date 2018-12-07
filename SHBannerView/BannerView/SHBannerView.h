//
//  SHBannerView.h
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBannerModel.h"
#import "SHBannerHeader.h"

@interface SHBannerView : UIScrollView

- (void)bannerUpdateSource:(NSArray <SHBannerModel *>*)bannerModels;

/**
 放在外面方便你自己修改
 */
@property (nonatomic, weak) UIPageControl *bannerPgae;
@end
