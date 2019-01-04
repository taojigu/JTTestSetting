//
//  JTTestSettingManager.h
//  JTTestSetting
//
//  Created by gus on 2018/10/4.
//

#import <Foundation/Foundation.h>

/**
 Manager Setting model data source
 */
@class JTTestSettingModel;

NS_ASSUME_NONNULL_BEGIN

@interface JTTestSettingManager : NSObject

- (void)configureSettingModleArray:(NSArray<JTTestSettingModel *> *)modelArray;

- (NSArray<JTTestSettingModel *> *) readSettingModelArray;

- (JTTestSettingModel *)testSettingModel:(NSString *)uniqKey;

- (void)saveTestSetting:(NSArray<JTTestSettingModel *> *)modelArray;

+ (void)executeTestSetting:(NSString *)uniqKey block:(void(^)(JTTestSettingModel *))block;

@end

NS_ASSUME_NONNULL_END
