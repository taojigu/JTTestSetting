//
//  ViewController.m
//  DemoTestSetting
//
//  Created by gus on 2018/10/3.
//  Copyright © 2018年 Gu. All rights reserved.
//

#import "ViewController.h"
#import <JTTestSettingViewController.h>
#import <JTTestSettingManager.h>
#import <JTTestSettingModel.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)presentTestSettingVC:(id)sender {
    JTTestSettingViewController *settingVC = [[JTTestSettingViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:settingVC animated:NO];
}

- (IBAction)readSettingButtonClicked:(id)sender {
    __block NSString * apiString = @"origin api string";
    [JTTestSettingManager executeTestSetting:@"ApiBaseURLString" block:^(JTTestSettingModel *model){
        apiString = (NSString *)model.value;
    }];
    NSLog(@"API String is %@",apiString);
}


@end
