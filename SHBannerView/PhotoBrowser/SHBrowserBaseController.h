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

@property (nonatomic, copy) void(^PhotoBrowserClick)(void);

@end

NS_ASSUME_NONNULL_END
