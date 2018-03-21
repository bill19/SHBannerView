//
//  SHBannerModel.h
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHBannerModel : NSObject

/**
 图片链接地址
 */
@property (nonatomic, copy) NSString *imageUrl;

/**
 跳转链接地址s
 */
@property (nonatomic, copy) NSString *webUrl;

+ (SHBannerModel *)creatWithImageUrl:(NSString *)imageUrl webUrl:(NSString *)imageUrl;

+ (UICollectionViewLayout *)creatHomeLayout;

@end
