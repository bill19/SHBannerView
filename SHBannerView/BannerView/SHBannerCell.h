//
//  SHBannerCell.h
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBannerModel.h"

@interface SHBannerCell : UICollectionViewCell

@property (nonatomic, strong) SHBannerModel *bannerModel;
@property (nonatomic, copy) void(^bannerCellDidClick)(SHBannerModel *bannerModel);
@end
