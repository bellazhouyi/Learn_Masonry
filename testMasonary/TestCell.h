//
//  TestCell.h
//  testMasonary
//
//  Created by NC on 16/10/26.
//  Copyright © 2016年 Bella. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Test;
@interface TestCell : UITableViewCell

@property (nonatomic ,strong) Test *testObject;


- (float)getTestCellHeight;

@end

@interface Test : NSObject

@property (nonatomic ,strong) UIColor *viewColor;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *detail;

@end

