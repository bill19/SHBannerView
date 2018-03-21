//
//  SHBannerCell.m
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHBannerCell.h"
#import "UIImageView+WebCache.h"
@interface SHBannerCell()

@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation SHBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setBannerModel:(SHBannerModel *)bannerModel {
    _bannerModel = bannerModel;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_bannerModel.imageUrl] placeholderImage:[UIImage imageNamed:@"banner_empty"]];
}

- (void)pushToNextSecondController {
    NSLog(@"---跳转");
}
@end
