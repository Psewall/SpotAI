//
//  AppDelegate.h
//  PlayOPC
//
//  Created by Hiroki Ishiura on 2015/03/20.
//  Copyright (c) 2015 Hiroki Ishiura. All rights reserved.
//
//  Released under the MIT license
//  http://opensource.org/licenses/mit-license.php
//

#import <UIKit/UIKit.h>

@class AppSetting;
@class AppCamera;
@class AppCameraLog;

/// OA.Centralから呼び出してもらうためのこのアプリのURLスキーム
extern NSString *const AppUrlSchemeGetFromOacentral;

/// OA.Centralから呼び出されたことをアプリ内に知らせるための通知名
extern NSString *const AppOACentralConfigurationDidGetNotification;

/// OA.Centralから呼び出されたことをアプリ内に知らせるための通知に付属する情報の辞書キー
/// (格納されている情報はOACentralConfigurationオブジェクト)
extern NSString *const AppOACentralConfigurationDidGetNotificationUserInfo;

/// アプリケーションデリゲート
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

/// アプリケーションインスタンスを取得します。
extern UIApplication *GetApp();

/// アプリ内で唯一のアプリケーションデリゲートインスタンスを取得します。
extern AppDelegate *GetAppDelegate();

/// アプリ内で唯一のアプリケーション設定インスタンスを取得します。
extern AppSetting *GetAppSetting();

/// アプリ内で唯一のカメラインスタンスを取得します。
extern AppCamera *GetAppCamera();

/// アプリ内で唯一のカメラログインスタンスを取得します。
extern AppCameraLog *GetAppCameraLog();
