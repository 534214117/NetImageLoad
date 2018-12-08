//
//  CustomTableViewCell.m
//  NetImageLoad
//
//  Created by Dong on 2018/12/8.
//  Copyright © 2018年 Sonia. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "AutolayoutNetImage/AutolayoutImageView.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

@interface CustomTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *answerLabel;

@end

@implementation CustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}


- (void)setModal:(QuestionModal *)modal {
    _modal = modal;
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    for (NSString *url in _modal.questionImageArray) {
        UIButton *imageView = [[UIButton alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [imageView addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageView];
    }
    
    for (NSString *url in _modal.answerImageArray) {
        UIButton *imageView = [[UIButton alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [imageView addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:imageView];
    }
    
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    
    self.answerLabel = [[UILabel alloc] init];
    [self addSubview:self.answerLabel];
    
    _titleLabel.text = _modal.question;
    _answerLabel.text = _modal.answer;
    
    if (_modal.questionImageArray.count > 0) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(10);
            make.left.mas_equalTo(self).offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.bottom.mas_equalTo(self.subviews[0].mas_top).offset(-10);
        }];
        
        [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.subviews[self->_modal.questionImageArray.count -1].mas_bottom).offset(10);
            make.left.mas_equalTo(self).offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.bottom.mas_equalTo(self->_modal.questionImageArray.count > 0 ? self.subviews[self->_modal.questionImageArray.count].mas_top : self).offset(-10);
        }];
    }
    else {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(10);
            make.left.mas_equalTo(self).offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.bottom.mas_equalTo(self.answerLabel).offset(-10);
        }];
        
        [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
            make.left.mas_equalTo(self).offset(10);
            make.right.mas_equalTo(self).offset(-10);
            make.bottom.mas_equalTo(self->_modal.questionImageArray.count > 0 ? self.subviews[self->_modal.questionImageArray.count].mas_top : self).offset(-10);
        }];
    }
    
    CGFloat width = (KScreenWidth - 40) / 3.f;
    
    for (int i = 0; i < _modal.questionImageArray.count; i++) {
        UIButton *imageView = self.subviews[i];
        [imageView sd_setBackgroundImageWithURL:[NSURL URLWithString:_modal.questionImageArray[i]] forState:UIControlStateNormal];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i / 3 == 0 ? self.titleLabel.mas_bottom : self.subviews[i - 3].mas_bottom).offset(10);
            make.left.mas_equalTo(i % 3 == 0 ? self : (self.subviews[i - 1].mas_right)).offset(10);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(width);
            if (i == self->_modal.questionImageArray.count - 1) {
                make.bottom.mas_equalTo(self.answerLabel.mas_top).offset(-10);
            }
        }];
    }
    
    int startIndex = (int)_modal.answerImageArray.count;
    for (int i = 0; i < _modal.answerImageArray.count; i++) {
        UIButton *imageView = self.subviews[i + startIndex];
        [imageView sd_setBackgroundImageWithURL:[NSURL URLWithString:_modal.answerImageArray[i]] forState:UIControlStateNormal];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(i / 3 == 0 ? self.answerLabel.mas_bottom : self.subviews[i + startIndex - 3].mas_bottom).offset(10);
            make.left.mas_equalTo(i % 3 == 0 ? self : (self.subviews[i + startIndex - 1].mas_right)).offset(10);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(width);
            if (i == self->_modal.answerImageArray.count - 1) {
                make.bottom.mas_equalTo(self).offset(-10);
            }
        }];
    }
    
}

- (void)test:(UIButton *)sender {
    NSLog(@"%@", [sender backgroundImageForState:UIControlStateNormal]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
