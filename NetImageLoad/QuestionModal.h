//
//  QuestionModal.h
//  NetImageLoad
//
//  Created by Dong on 2018/12/8.
//  Copyright © 2018年 Sonia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionModal : NSObject

@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;
@property (nonatomic, strong) NSArray  *questionImageArray;
@property (nonatomic, strong) NSArray  *answerImageArray;

@end

NS_ASSUME_NONNULL_END
