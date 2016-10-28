//
//  TestCell.m
//  testMasonary
//
//  Created by NC on 16/10/26.
//  Copyright © 2016年 Bella. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



#import "TestCell.h"
#import "Masonry.h"


@interface TestCell ()


@property (nonatomic ,strong) UIView *view;
@property (nonatomic ,strong) UILabel *name;
@property (nonatomic ,strong) UILabel *detail;

@end

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UIView *)view {
    if (!_view) {
        _view = [UIView new];
    }
    return _view;
}

- (UILabel *)name {
    if (!_name) {
        _name = [UILabel new];
    }
    return _name;
}
- (UILabel *)detail {
    if (!_detail) {
        _detail = [UILabel new];
    }
    return _detail;
}

- (void)setTestObject:(Test *)testObject {
    _testObject = testObject;
    __weak typeof(self) ws = self;
    [self.contentView addSubview:self.view];
    _view.backgroundColor = testObject.viewColor;
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(15);
        make.top.equalTo(ws.contentView.mas_top).offset(15);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    [self.contentView addSubview:self.name];
    self.name.text = testObject.name;
    _name.numberOfLines = 0;
    _name.textColor = [UIColor blueColor];
    _name.font = [UIFont systemFontOfSize:15];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_right).offset(8);
        make.top.equalTo(ws.view.mas_top);
        make.right.equalTo(ws.contentView.mas_right).offset(-15);
    }];
    
    [self.contentView addSubview:self.detail];
    _detail.text = testObject.detail;
    _detail.numberOfLines = 3;
    _detail.font = [UIFont systemFontOfSize:14];
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_right).offset(8);
        make.top.equalTo(ws.name.mas_bottom).offset(4);
        make.right.equalTo(ws.contentView.mas_right).offset(-15);
        make.bottom.greaterThanOrEqualTo(ws.view.mas_bottom);
    }];
}

- (float)getTestCellHeight {
    [self layoutIfNeeded];
    return self.detail.frame.origin.y + self.detail.frame.size.height +4;
}

@end

@implementation Test



@end
