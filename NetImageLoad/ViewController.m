//
//  ViewController.m
//  NetImageLoad
//
//  Created by 第一反应 on 2018/12/7.
//  Copyright © 2018 Sonia. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+WebCache.h>
#import <Masonry.h>
#import "CustomTableViewCell.h"
#import "QuestionModal.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *imageTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QuestionModal *modal1 = [[QuestionModal alloc] init];
    QuestionModal *modal2 = [[QuestionModal alloc] init];
    QuestionModal *modal3 = [[QuestionModal alloc] init];
    
    modal1.questionImageArray = @[@"http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/8326cffc1e178a8248235a59f703738da977e828.jpg",@"http://e.hiphotos.baidu.com/zhidao/pic/item/d043ad4bd11373f046de7deaa70f4bfbfaed04e5.jpg"];
    modal1.answerImageArray = @[@"http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/8326cffc1e178a8248235a59f703738da977e828.jpg",@"http://e.hiphotos.baidu.com/zhidao/pic/item/d043ad4bd11373f046de7deaa70f4bfbfaed04e5.jpg"];
    
    modal2.questionImageArray = @[@"http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/2f738bd4b31c8701c06f3706257f9e2f0608ff71.jpg",@"http://c.hiphotos.baidu.com/zhidao/pic/item/00e93901213fb80e41cc15fa35d12f2eb93894f9.jpg"];
    modal2.answerImageArray = @[@"http://gss0.baidu.com/9vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/2f738bd4b31c8701c06f3706257f9e2f0608ff71.jpg",@"http://c.hiphotos.baidu.com/zhidao/pic/item/00e93901213fb80e41cc15fa35d12f2eb93894f9.jpg"];
    
    modal3.questionImageArray = @[@"http://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/c9fcc3cec3fdfc033a05f6c3d03f8794a4c2264f.jpg",@"http://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/0d338744ebf81a4c63aec303d72a6059242da65f.jpg",@"http://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/472309f79052982272db37a7d4ca7bcb0b46d4ed.jpg"];
    modal3.answerImageArray = @[@"http://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/c9fcc3cec3fdfc033a05f6c3d03f8794a4c2264f.jpg",@"http://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/0d338744ebf81a4c63aec303d72a6059242da65f.jpg",@"http://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/472309f79052982272db37a7d4ca7bcb0b46d4ed.jpg"];

    
    [self.dataArray addObject:modal1];
    [self.dataArray addObject:modal2];
    [self.dataArray addObject:modal3];
    
    
    [self.view addSubview:self.imageTableView];
    [self.imageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(0);
        make.left.mas_equalTo(self.view).offset(0);
        make.right.mas_equalTo(self.view).offset(0);
        make.bottom.mas_equalTo(self.view).offset(0);
    }];
    
}

- (UITableView *)imageTableView {
    if (!_imageTableView) {
        _imageTableView = [[UITableView alloc] init];
        _imageTableView.delegate = self;
        _imageTableView.dataSource = self;
        _imageTableView.estimatedRowHeight = 80;
        _imageTableView.rowHeight = UITableViewAutomaticDimension;
        _imageTableView.tableFooterView = [UIView new];
    }
    return _imageTableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    cell.modal = self.dataArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

@end
