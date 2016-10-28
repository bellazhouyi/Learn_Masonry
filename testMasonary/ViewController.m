//
//  ViewController.m
//  testMasonary
//
//  Created by NC on 16/10/20.
//  Copyright © 2016年 Bella. All rights reserved.
//

#import "ViewController.h"
#import "BasicView.h"

#import "TestCell.h"

static NSString *testCellIdentifier = @"testCell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *testArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    __weak typeof(self) ws = self;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(15);
        make.left.equalTo(ws.view.mas_left);
        make.width.equalTo(ws.view.mas_width);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TestCell class] forCellReuseIdentifier:testCellIdentifier];
    
    Test *t1 = [Test new];
    t1.viewColor = [UIColor redColor];
    t1.name = @"在之前各种找自适";
    t1.detail = @"都感觉代码好多，现在又得结合masonry来自动计算cell的高度";
    
    Test *t2 = [Test new];
    t2.viewColor = [UIColor blackColor];
    t2.name = nil;
    t2.detail = @"  但是要想实现这个功能的话，你得准备好masonry框架，可通过cocoapods方法或者手动添加导入实现，手动导入masonry的下载链接";
    
    Test *t3 = [Test new];
    t3.viewColor = [UIColor orangeColor];
    t3.name = @"首选";
    t3.detail = @"masonry 在你尚未设置右侧约束或者宽度或者";
    
    Test *t4 = [Test new];
    t4.viewColor = [UIColor orangeColor];
    t4.name = @"首选";
    t4.detail = @"设置顶部和左侧，仅仅只设置这两个约束条件，不进行该控件的其它约束设置的时候，这时他的高度和宽度是自适应的，可以无限加长（在你尚未设置右侧约束或者宽度或者";
    
    Test *t5 = [Test new];
    t5.viewColor = [UIColor orangeColor];
    t5.name = @"首选";
    t5.detail = @"有所了解，比方说，UILabel  在masonry下设置顶部和左侧，仅仅只设置这两个约束条件，不进行该控件的其它约束设置的时候，这时他的高度和宽度是自适应的，可以无限加长（在你尚未设置右侧约束或者宽度或者";
    
    Test *t6 = [Test new];
    t6.viewColor = [UIColor orangeColor];
    t6.name = @"首选";
    t6.detail = @"比方说，UILabel  在masonry下设置顶部和左侧，仅仅只设置这两个约束条件，不进行该控件的其它约束设置的时候，这时他的高度和宽度是自适应的，可以无限加长（在你尚未设置右侧约束或者宽度或者";
    
    Test *t8 = [Test new];
    t8.viewColor = [UIColor orangeColor];
    t8.name = @"首选";
    t8.detail = @"Label  在masonry下设置顶部和左侧，";
    
    Test *t7 = [Test new];
    t7.viewColor = [UIColor orangeColor];
    t7.name = @"首选";
    t7.detail = @"bel  在masonry";
    
    Test *t9 = [Test new];
    t9.viewColor = [UIColor orangeColor];
    t9.name = @"首选";
    t9.detail = @"比方说，UILabel  ";
    self.testArray = [NSArray arrayWithObjects:t1, t2, t3, t4, t5, t6, t7, t8, t9, nil];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - delegate
float cellHeight = 60;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.testArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:testCellIdentifier forIndexPath:indexPath];
    Test *test = [self.testArray objectAtIndex:indexPath.row];
    cell.testObject = test;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [[TestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:testCellIdentifier];
    Test *test = [self.testArray objectAtIndex:indexPath.row];
    cell.testObject = test;
   // [cell layoutIfNeeded];
    
    return [cell getTestCellHeight];
}
@end
