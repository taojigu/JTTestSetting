//
//  KFTestCaseViewController.h
//  KnowFriends
//
//  Created by 顾吉涛Air on 2018/10/29.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
 
NS_ASSUME_NONNULL_BEGIN
/**
 运行测试用例的 ViewController 的基类
 */
@interface JTTestCaseViewController : UITableViewController

/**
 新增一个test case
 @param title Test case 的名称
 @param selector Test Case 运行的方法selector
 */
- (void)insertTestCase:(NSString *)title selector:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
