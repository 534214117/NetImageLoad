//
//  QuestionModal.m
//  NetImageLoad
//
//  Created by Dong on 2018/12/8.
//  Copyright © 2018年 Sonia. All rights reserved.
//

#import "QuestionModal.h"

@implementation QuestionModal

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.question = @"问题";
        self.answer = @"答案";
        self.questionImageArray = @[];
        self.answerImageArray = @[];
    }
    return self;
}

@end
