//
//  JTTestSettingModel.h
//  Pods
//
//  Created by gus on 2018/10/4.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JTTestSettingType){
    JTTestSettingTypeTextString = 0,
    JTTestSettingTypeBOOL = 1
};


NS_ASSUME_NONNULL_BEGIN

@interface JTTestSettingModel : NSObject <NSCoding>

@property (nonatomic, assign) JTTestSettingType settingType;
@property (nonatomic, copy) NSString *uniqKey;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSObject *value;
@property (nonatomic, assign) BOOL active;

@end

NS_ASSUME_NONNULL_END
