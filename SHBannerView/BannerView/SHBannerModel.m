//
//  SHBannerModel.m
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHBannerModel.h"

@implementation SHBannerModel

+ (SHBannerModel *)creatWithImageUrl:(NSString *)imageUrl webUrl:(NSString *)webUrl {
    SHBannerModel *model = [[SHBannerModel alloc] init];
    model.imageUrl = imageUrl;
    model.webUrl = webUrl;
    return model;
}
+ (UICollectionViewLayout *)creatHomeLayout {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.75);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.collectionView.showsVerticalScrollIndicator = 0;
    layout.collectionView.showsHorizontalScrollIndicator = 0;
    layout.collectionView.pagingEnabled = YES;
    layout.collectionView.bounces = NO;
    return layout;
}
@end
