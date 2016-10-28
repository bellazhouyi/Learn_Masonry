//
//  BasicView.m
//  testMasonary
//
//  Created by NC on 16/10/24.
//  Copyright © 2016年 Bella. All rights reserved.
//

#import "BasicView.h"
#import "Masonry.h"

@implementation BasicView

- (instancetype)init {
    if (self = [super init]) {
        [self drawView];
    }
    return self;
}

- (void)drawView {
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self addSubview:redView];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [self addSubview:blueView];
    
    UIView *yellowView = [UIView new];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self addSubview:yellowView];
    
    __weak typeof(self) weakSelf = self;
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).height.offset(15);
        make.left.equalTo(weakSelf).with.offset(15);
        make.width.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).height.offset(15);
        make.left.equalTo(redView).width.offset(10);
        make.width.equalTo(redView);
    }];
}

@end
