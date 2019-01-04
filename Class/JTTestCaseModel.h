//
//  DKTestCaseModel.h
//  KnowFriends
//
//  Created by 顾吉涛Air on 2018/10/29.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 Test Case 的数据结构
 */
@interface JTTestCaseModel : NSObject 

//Test Case 名称
@property (nonatomic, copy) NSString *title;
//Test Case 运行的方法 selector
@property (nonatomic, assign) SEL caseSelector;

@end

NS_ASSUME_NONNULL_END
