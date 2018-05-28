//
//  SHBannerView.m
//  SHBannerView
//
//  Created by HaoSun on 2018/3/21.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHBannerView.h"
#import "SHBannerModel.h"
#import "SHBannerCell.h"
#import "Masonry.h"
static NSInteger kBannerTimes = 500;
@interface SHBannerView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray <SHBannerModel *>* bannerModels;

@end

@implementation SHBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = self.bounds.size;
        self.showsVerticalScrollIndicator = 0;
        self.showsHorizontalScrollIndicator = 0;
        self.alwaysBounceVertical = YES;
        self.delegate = self;
        [self setupCollectionView];
        [self setupPageControl];
    }
    return self;
}

- (void)setupCollectionView {
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kBannerScreenWidth, kBannerView_H) collectionViewLayout:[SHBannerModel creatHomeLayout]];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.pagingEnabled = YES;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[SHBannerCell class] forCellWithReuseIdentifier:kBannerReuseIdentifier];
    _collectionView = collectionView;
    [self addSubview:_collectionView];

}

- (void)setupPageControl {
    UIPageControl *bannerPgae = [[UIPageControl alloc] init];
    bannerPgae.pageIndicatorTintColor = [UIColor blackColor];
    bannerPgae.currentPageIndicatorTintColor = [UIColor redColor];
    bannerPgae.userInteractionEnabled = NO;
    _bannerPgae = bannerPgae;
    [self addSubview:_bannerPgae];
    [_bannerPgae mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(_collectionView);
        make.height.mas_equalTo(kBannerPageControlHeight);
        make.bottom.mas_equalTo(_collectionView.mas_bottom);
    }];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHBannerCell *bannerCell = [collectionView dequeueReusableCellWithReuseIdentifier:kBannerReuseIdentifier forIndexPath:indexPath];
    bannerCell.bannerModel = [self modelForIndexPath:indexPath];
    return bannerCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.bannerModels.count > 1) {
        return self.bannerModels.count * kBannerTimes * 2;
    }
    return 1;
}

- (NSInteger)numberOfSections {
    return 1;
}


- (SHBannerModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    NSInteger item = (indexPath.item % kBannerTimes) % self.bannerModels.count;
    if (item < self.bannerModels.count) {
        return self.bannerModels[item];
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return _collectionView.bounds.size;
}

#pragma mark scrollViewDelegate 代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self && (scrollView.contentOffset.y + kBannerStatuBarHeight) < 0) {
        CGFloat sx = 1 - ((scrollView.contentOffset.y + kBannerStatuBarHeight) / kBannerView_H * 3.6);//放大比例
        self.collectionView.transform = CGAffineTransformScale(CGAffineTransformIdentity, sx,sx);
        _bannerPgae.transform = CGAffineTransformMakeTranslation(0, - (scrollView.contentOffset.y + kBannerStatuBarHeight));
    }
    if (scrollView == _collectionView && self.bannerModels.count > 1) {
        NSInteger index =  ((NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width)) % self.bannerModels.count;
        _bannerPgae.currentPage = index;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self addTimer];
}

- (void)nextImage {
    if (self.bannerModels.count > 1) {//若是一张图的时候隐藏小点点
        NSIndexPath *currrentIndexPath = [[_collectionView indexPathsForVisibleItems] lastObject];
        NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currrentIndexPath.item inSection:0];
        [_collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        NSInteger nextItem = currentIndexPathReset.item + 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:0];
        [_collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
}

/**增加定时器*/
- (void)addTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

/**删除定时器*/
- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)bannerUpdateSourec:(NSArray <SHBannerModel *>*)bannerModels {
    if (bannerModels.count > 1) {
        self.bannerModels = bannerModels;
        _bannerPgae.numberOfPages = bannerModels.count;
        [self addTimer];
        [_collectionView reloadData];
        NSIndexPath * path = [NSIndexPath indexPathForItem:_bannerModels.count * kBannerTimes inSection:0];
        [_collectionView scrollToItemAtIndexPath:path atScrollPosition:0 animated:NO];
    }else{
        SHBannerModel *model = [[SHBannerModel alloc] init];
        model.imageUrl = [[bannerModels firstObject] imageUrl];
        model.webUrl = [[bannerModels firstObject] webUrl];
        self.bannerModels = @[model];
    }
}

- (NSArray<SHBannerModel *> *)bannerModels {
    if (!_bannerModels) {
        _bannerModels = [NSArray array];
    }
    return _bannerModels;
}
@end
