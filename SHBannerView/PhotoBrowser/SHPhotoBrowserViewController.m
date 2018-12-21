//
//  SHPhotoBrowserViewController.m
//  SHBannerView
//
//  Created by sunhao on 2018/12/4.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHPhotoBrowserViewController.h"
#import "SHBannerModel.h"
#import "SHBannerCell.h"
#import "SHBannerHeader.h"
#import "Masonry.h"
@interface SHPhotoBrowserViewController ()< UICollectionViewDelegate,
                                            UICollectionViewDataSource,
                                            UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray <SHBannerModel *>* bannerModels;
@end

@implementation SHPhotoBrowserViewController

#pragma mark - life circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupController];
    [self request];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"";
    self.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(0.0);
        make.width.height.mas_equalTo(kBannerScreenWidth);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
}

#pragma mark layout subviews
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Layout subviews in this method.
}
#pragma mark - button action

#pragma mark - gesture

#pragma mark - KVO

#pragma mark - noticfication

#pragma mark - protocolName methods //protocolName 写具体的protocol名称

#pragma mark - data source
- (void)bannerUpdateSource:(NSArray <SHBannerModel *>*)bannerModels {
    self.bannerModels = bannerModels;
    [_collectionView reloadData];
}
#pragma mark - HTTP request
- (void)request {

}
#pragma mark - delegate  -  UICollectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    __weak __typeof(self)weakSelf = self;
    SHBannerCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:kBannerReuseIdentifier forIndexPath:indexPath];
    bannerCell.bannerModel = [self modelForIndexPath:indexPath];
    bannerCell.bannerCellDidClick = ^(SHBannerModel *bannerModel) {
        weakSelf.photoBrowserDidItem(bannerModel, indexPath.row);
    };
    return bannerCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.bannerModels.count;
}

- (NSInteger)numberOfSections {
    return 1;
}

- (SHBannerModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    NSInteger item = indexPath.item;
    if (item < self.bannerModels.count) {
        return self.bannerModels[item];
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _collectionView.bounds.size;
}
#pragma mark - others

#pragma mark - setters&getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[SHBannerModel creatHomeLayout]];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.bounces = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        [collectionView registerClass:[SHBannerCell class] forCellWithReuseIdentifier:kBannerReuseIdentifier];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (NSArray<SHBannerModel *> *)bannerModels {
    if (!_bannerModels) {
        _bannerModels = [NSArray array];
    }
    return _bannerModels;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    if (scrollView == self.collectionView) {

    }
}

@end
