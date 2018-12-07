//
//  SHPhotoBrowserViewController.h
//  SHBannerView
//
//  Created by sunhao on 2018/12/4.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBrowserBaseController.h"
@class SHBannerModel;
@interface SHPhotoBrowserViewController : SHBrowserBaseController

- (void)bannerUpdateSource:(NSArray <SHBannerModel *>*)bannerModels;

@end
