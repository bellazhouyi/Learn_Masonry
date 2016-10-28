//
//  UIView+Masonry.m
//  testMasonary
//
//  Created by NC on 16/10/28.
//  Copyright © 2016年 Bella. All rights reserved.
//

#import "UIView+Masonry.h"

@implementation UIView (Masonry)

- (void)distributeSpacingHorizontallyWith:(NSArray *)views {
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count + 1];
    
    for (int i = 0; i < views.count + 1; ++i) {
        UIView *view = [UIView new];
        [spaces addObject:view];
        [self addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(view.mas_height);
        }];
    }
    
    UIView *view0 = spaces[0];
    
    __weak __typeof(&*self) ws = self;
    
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.centerY.equalTo(((UIView *)views[0]).mas_centerY);
    }];
    
    UIView *lastSpace = view0;
    for (int index = 0; index < views.count; ++index) {
        UIView *obj = views[index];
        UIView *space = spaces[index+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastSpace.mas_right);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(obj.mas_right);
            make.centerY.equalTo(obj.mas_centerY);
            make.width.equalTo(view0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right);
    }];
}

- (void) distributeSpacingVerticallyWith:(NSArray*)views
{
    NSMutableArray *spaces = [NSMutableArray arrayWithCapacity:views.count+1];
    
    for ( int i = 0 ; i < views.count+1 ; ++i )
    {
        UIView *v = [UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
    }
    
    
    UIView *v0 = spaces[0];
    
    __weak __typeof(&*self)ws = self;
    
    [v0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.centerX.equalTo(((UIView*)views[0]).mas_centerX);
    }];
    
    UIView *lastSpace = v0;
    for ( int i = 0 ; i < views.count; ++i )
    {
        UIView *obj = views[i];
        UIView *space = spaces[i+1];
        
        [obj mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastSpace.mas_bottom);
        }];
        
        [space mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(obj.mas_bottom);
            make.centerX.equalTo(obj.mas_centerX);
            make.height.equalTo(v0);
        }];
        
        lastSpace = space;
    }
    
    [lastSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom);
    }];
}

@end
