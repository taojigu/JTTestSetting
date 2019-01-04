//
//  JTTestSettingViewController.m
//  Pods
//
//  Created by 顾吉涛Air on 2018/9/30.
//

#import "JTTestSettingViewController.h"
#import "JTTestSettingManager.h"
#import "JTTestSettingModel.h"
#import "JTTestSettingTextFieldCell.h"
#import <YYCache/YYCache.h>
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

@interface JTTestSettingViewController ()

@property (nonatomic, strong) NSArray *settingModelArray;
@property (nonatomic, strong) YYCache *cache;

@end

@implementation JTTestSettingViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        _settingModelArray = [NSMutableArray array];
        [self initNavigationItem];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    JTTestSettingManager *manager = [[JTTestSettingManager alloc] init];
    self.settingModelArray = [manager readSettingModelArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.settingModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JTTestSettingModel *model
    = self.settingModelArray[indexPath.row];
    if (model.settingType == JTTestSettingTypeTextString) {
        return [self textFieldCell:indexPath];
    }
   
    return nil;
}

- (UITableViewCell *)textFieldCell:(NSIndexPath *)indexPath {
    static NSString *textFieldCellIdentier = @"JTTestSettingTextFieldCell";
    JTTestSettingTextFieldCell *cell = [self.tableView dequeueReusableCellWithIdentifier:textFieldCellIdentier];
    if (!cell) {
        cell = [[JTTestSettingTextFieldCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:textFieldCellIdentier];
        cell.fd_enforceFrameLayout = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    JTTestSettingModel *model = self.settingModelArray[indexPath.row];
    [cell configureTestSettingModel:model];
    return cell;
}

#pragma mark -- init messages

- (void)initNavigationItem {
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveSettingButtonClicekd)];
    self.navigationItem.rightBarButtonItem = saveButtonItem;
}

- (void) saveSettingButtonClicekd {
    JTTestSettingManager *manager = [[JTTestSettingManager alloc] init];
    [manager saveTestSetting:self.settingModelArray];
    if (@available(iOS 8.0, *)) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"设置已经生效" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    };
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
