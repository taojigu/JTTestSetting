//
//  JTTestSettingTextFieldCell.m
//  Pods
//
//  Created by gus on 2018/10/4.
//

#import "JTTestSettingTextFieldCell.h"
#import <Masonry/Masonry.h>
#import "JTTestSettingModel.h"

@interface JTTestSettingTextFieldCell () <UITextFieldDelegate>

@property (nonatomic, strong)JTTestSettingModel *testSettingModel;

@end

@implementation JTTestSettingTextFieldCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self privateInit];
        [self initConstraints];
    }
    return self;
}

- (void)configureTestSettingModel:(JTTestSettingModel *)settingModel {
    self.testSettingModel = settingModel;
    self.nameLabel.text = self.testSettingModel.name;
    self.valueTextField.text = (NSString *)self.testSettingModel.value;
    self.activeSwitch.on = self.testSettingModel.active;
}

- (void)initConstraints {
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).with.offset(50);
        make.top.mas_equalTo(self).with.offset(10);
        make.width.mas_equalTo(100);
    }];
    
    [self.valueTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).with.offset(10);
        make.bottom.mas_equalTo(self).with.offset(-15);
        make.trailing.mas_equalTo(self).with.offset(-10);
    }];
    
    [self.activeSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.nameLabel);
        make.trailing.mas_equalTo(self).with.offset(-15);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(self.nameLabel);
    }];
}

#pragma mark -- delegate and target messages

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.testSettingModel.value = textField.text;
}


- (void)activeSwitchChanged {
    self.testSettingModel.active = self.activeSwitch.on;
}

#pragma mark -- Init

- (void)privateInit {
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.numberOfLines = 1;
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.nameLabel];
    
    self.valueTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.valueTextField.placeholder = @"Please Input Here";
    self.valueTextField.backgroundColor = [UIColor grayColor];
    self.valueTextField.delegate = self;
    [self addSubview:self.valueTextField];
    
    self.activeSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [self addSubview:self.activeSwitch];
    [self.activeSwitch addTarget:self action:@selector(activeSwitchChanged) forControlEvents:UIControlEventValueChanged];
    
}


@end
