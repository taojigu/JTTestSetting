//
//  JTTestSettingManager.m
//  JTTestSetting
//
//  Created by gus on 2018/10/4.
//

#import "JTTestSettingManager.h"
#import "JTTestSettingModel.h"
#import <YYCache/YYCache.h>


NSString *const JTTestSettingModelArrayKey = @"JTTestSettingModelArrayKey";

@interface JTTestSettingManager ()

@property (nonatomic, strong) YYCache *cache;

@end

@implementation JTTestSettingManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [YYCache cacheWithName:NSStringFromClass([self class])];
    }
    return self;
}

- (void)configureSettingModleArray:(NSArray<JTTestSettingModel *> *)modelArray {
    
    for (JTTestSettingModel *model in modelArray) {
        if ([self.cache containsObjectForKey:model.uniqKey]) {
            continue;
        }
        [self.cache setObject:model forKey:model.uniqKey];
    }
    
    [self.cache setObject:modelArray forKey:JTTestSettingModelArrayKey];
}

- (NSArray<JTTestSettingModel *> *) readSettingModelArray {
    NSArray *modelArray = (NSArray *)[self.cache objectForKey:JTTestSettingModelArrayKey];
    NSMutableArray *resultArray = [NSMutableArray array];
    for (JTTestSettingModel *model in modelArray) {
        JTTestSettingModel *cacheModel = [self testSettingModel:model.uniqKey];
        NSAssert(cacheModel, @"cache model should not be nil");
        [resultArray addObject:cacheModel];
    }
    return resultArray;
}

- (JTTestSettingModel *)testSettingModel:(NSString *)uniqKey {
    return (JTTestSettingModel *)[self.cache objectForKey:uniqKey];
}

- (void)saveTestSetting:(NSArray<JTTestSettingModel *> *)modelArray {
    for (JTTestSettingModel *model in modelArray) {
        [self.cache setObject:model forKey:model.uniqKey];
    }
}

+ (void)executeTestSetting:(NSString *)uniqKey block:(void(^)(JTTestSettingModel *))block {
    JTTestSettingManager *manager = [[JTTestSettingManager alloc] init];
    JTTestSettingModel *model = [manager testSettingModel:uniqKey];
    if (!model.active) {
        return;
    }
    block(model);
}

@end
