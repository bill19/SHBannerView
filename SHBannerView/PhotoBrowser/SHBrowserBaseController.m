//
//  SHBrowserBaseController.m
//  SHBannerView
//
//  Created by sunhao on 2018/12/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHBrowserBaseController.h"

@interface SHBrowserBaseController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIView *backgroundView;
@end

@implementation SHBrowserBaseController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backgroundView];
}


- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
        _backgroundView.userInteractionEnabled = YES;
        _backgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
        UITapGestureRecognizer *tapSignle = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSignleClick:)];
        [_backgroundView addGestureRecognizer:tapSignle];
    }
    return _backgroundView;
}

- (void)tapSignleClick:(UITapGestureRecognizer *)signle {

    if (self.PhotoBrowserClick) {
        self.PhotoBrowserClick();
    }
}

@end
