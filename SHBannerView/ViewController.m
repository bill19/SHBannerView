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
#import "SHPhotoBrowserViewController.h"
@interface ViewController ()

@property (nonatomic, weak) SHBannerView *bannerView;
@property (nonatomic, strong) NSArray *source;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setupBannerView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(setupBrowser) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
}

- (void)request {
    [_bannerView bannerUpdateSource:self.source];
}

#pragma mark -KNBannerViewDelegate 轮播图代理方法
- (void)setupBannerView {
    SHBannerView *bannerView = [[SHBannerView alloc] initWithFrame:CGRectMake(0, -kBannerStatuBarHeight, kBannerScreenWidth, kBannerScreenHeight)];
    _bannerView = bannerView;
    [self.view addSubview:_bannerView];
    _bannerView.bannerPgae.pageIndicatorTintColor = [UIColor purpleColor];
    _bannerView.bannerPgae.currentPageIndicatorTintColor = [UIColor greenColor];
    [self request];
}

- (void)setupBrowser{
    SHPhotoBrowserViewController *vc = [[SHPhotoBrowserViewController alloc] init];
    vc.PhotoBrowserBackgroundClick = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    [vc bannerUpdateSource:self.source];
    [self presentViewController:vc animated:YES completion:nil];

}

- (NSArray *)source {
    if (!_source) {
        NSMutableArray *mu = [NSMutableArray array];
        NSArray * images = @[@"http://pic12.photophoto.cn/20090910/0005018303466977_b.jpg",
                             @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1521612459766&di=4def9c448387c4b7e8f12de4f28ccb46&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3D9cb3315ee1f81a4c323fe48abf430a2c%2F500fd9f9d72a6059b5ad62302234349b033bba5f.jpg",
                             @"http://pic40.nipic.com/20140412/11857649_170524977000_2.jpg",
                             @"http://p1.wmpic.me/article/2017/11/15/1510724610_EyEUUQAP.jpg",
                             @"http://pic60.nipic.com/file/20150207/11284670_083602732000_2.jpg",
                             @"http://knoya-qd.erp.knoya.com/es/quality_issues_pic/0/20180524142013.jpeg?OSSAccessKeyId=cjQsDX9bON3Pgzyc&Expires=1527234223&Signature=Il%2FhsdQIY%2F%2BGnqBUyWWFUQEdGcQ%3D"];
        for (NSInteger index = 0; index < images.count; index ++) {
            SHBannerModel *model = [[SHBannerModel alloc] init];
            model.imageUrl = [images objectAtIndex:index];
            model.webUrl = @"777";
            [mu addObject:model];
        }
        _source = mu;
    }
    return _source;
}

@end
