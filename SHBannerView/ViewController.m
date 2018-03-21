//
//  ViewController.m
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHBannerView.h"
#import "SHBannerModel.h"

@interface ViewController ()

@property (nonatomic, weak) SHBannerView *bannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBannerView];
}

- (void)request {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < 0; index ++) {
        SHBannerModel *model = [[SHBannerModel alloc] init];
        model.imageUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521612459766&di=4def9c448387c4b7e8f12de4f28ccb46&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D9cb3315ee1f81a4c323fe48abf430a2c%2F500fd9f9d72a6059b5ad62302234349b033bba5f.jpg";
        model.webUrl = @"777";
        [mu addObject:model];
    }
    [_bannerView bannerUpdateSourec:mu];
}

#pragma mark -KNBannerViewDelegate 轮播图代理方法
- (void)setupBannerView {
    SHBannerView *bannerView = [[SHBannerView alloc] initWithFrame:CGRectMake(0, -kBannerStatuBarHeight, kBannerScreenWidth, kBannerScreenHeight)];
    _bannerView = bannerView;
    [self.view addSubview:_bannerView];
    [self request];
}
@end
