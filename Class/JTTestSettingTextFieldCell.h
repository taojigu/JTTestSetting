//
//  JTTestSettingTextFieldCell.h
//  Pods
//
//  Created by gus on 2018/10/4.
//

#import <UIKit/UIKit.h>
@class JTTestSettingModel;

NS_ASSUME_NONNULL_BEGIN

@interface JTTestSettingTextFieldCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextField* valueTextField;
@property (nonatomic, strong) UISwitch *activeSwitch;

- (void)configureTestSettingModel:(JTTestSettingModel *)settingModel;

@end

NS_ASSUME_NONNULL_END
