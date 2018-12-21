//
//  SHBrowserBaseController.h
//  SHBannerView
//
//  Created by sunhao on 2018/12/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHBrowserBaseController : UIViewController

/**
 背景点击
 */
@property (nonatomic, copy) void(^PhotoBrowserBackgroundClick)(void);
/**
 是否需要毛玻璃效果
 */
@property (nonatomic, assign) BOOL isEffect;
@end

NS_ASSUME_NONNULL_END
