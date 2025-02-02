//
//  AppDelegate.m
//  PlayOPC
//
//  Created by Hiroki Ishiura on 2015/03/20.
//  Copyright (c) 2015 Hiroki Ishiura. All rights reserved.
//
//  Released under the MIT license
//  http://opensource.org/licenses/mit-license.php
//

#import "AppDelegate.h"
#import <OLYCameraKit/OACentralConfiguration.h>
#import "AppSetting.h"
#import "AppCamera.h"
#import "AppCameraLog.h"

NSString *const AppUrlSchemeGetFromOacentral = @"net.sewall.SpotAI.GetFromOacentral";
NSString *const AppOACentralConfigurationDidGetNotification = @"AppOACentralConfigurationDidGetNotification";
NSString *const AppOACentralConfigurationDidGetNotificationUserInfo = @"AppOACentralConfigurationDidGetNotificationUserInfo";

@interface AppDelegate ()

@property (strong, nonatomic) AppSetting *setting; ///< アプリケーション設定
@property (strong, nonatomic) AppCamera *camera; ///< カメラ
@property (strong, nonatomic) AppCameraLog *cameraLog; ///< カメラキットのログ履歴

@end

#pragma mark -

@implementation AppDelegate

#pragma mark -

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	DEBUG_LOG(@"launchOptions=%@", launchOptions);

	// Storyboardで設定しても有効にならないので、ここで規定の色合いをハードコーディングして変更します。
    // Storyboard Even if you set it with, it will not be effective, so hard-code the specified color here and change it.
	[UINavigationBar appearance].barTintColor = [UIColor colorNamed:@"NaviBarBackColor"];
	[UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorNamed:@"NaviBarTextColor"]};
	[UINavigationBar appearance].tintColor = [UIColor colorNamed:@"NaviBarItemColor"];
	
	// カメラログインスタンスをカメラインスタンスより先に生成しておかないと、カメラの初期化に関わるログが記録されません。
    //If the camera log instance is not created before the camera instance, the log related to camera initialization will not be recorded.
	self.setting = [[AppSetting alloc] init];
	self.cameraLog = [[AppCameraLog alloc] init];
	self.camera = [[AppCamera alloc] init];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	DEBUG_LOG(@"");
	// やらなければならないことは全てConnectionViewControllerで行います。
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	DEBUG_LOG(@"");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	DEBUG_LOG(@"");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	DEBUG_LOG(@"");
	// やらなければならないことは全てConnectionViewControllerで行います。
}

- (void)applicationWillTerminate:(UIApplication *)application {
	DEBUG_LOG(@"");
	
	// カメラログインスタンスをカメラインスタンスより後に解放しないと、カメラの終了に関わるログが記録されません。
	self.setting = nil;
	self.camera = nil;
	self.cameraLog = nil;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
	DEBUG_LOG(@"url=%@, options=%@", url, options);
	
	if ([[url scheme] isEqualToString:AppUrlSchemeGetFromOacentral]) {
		// OA.Centralから呼び出されました。
		// OA.Centralが保持している設定情報を送り返してきています。
		OACentralConfiguration *configuration = [[OACentralConfiguration alloc] initWithConfigurationURL:url];
		DEBUG_LOG(@"configuration.bleName=%@", configuration.bleName);
		DEBUG_LOG(@"configuration.bleCode=%@", configuration.bleCode);

		// OA.Centralから接続設定を取得したことをお知らせします。
		// この設定情報を欲しがっているビューコントローラーは、このインスタンスから遠いところにいるので、通知を使って届けます。
		NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
		NSDictionary *userInfo = @{
			AppOACentralConfigurationDidGetNotificationUserInfo:configuration
		};
		[notificationCenter postNotificationName:AppOACentralConfigurationDidGetNotification object:self userInfo:userInfo];
	}
	return YES;
}

@end

#pragma mark -

UIApplication *GetApp() {
	return UIApplication.sharedApplication;
}

AppDelegate *GetAppDelegate() {
	__block AppDelegate *delegate = nil;
	if ([NSThread isMainThread]) {
		delegate = (AppDelegate *)(GetApp().delegate);
	} else {
		dispatch_sync(dispatch_get_main_queue(), ^{
			delegate = (AppDelegate *)(GetApp().delegate);
		});
	}
	if (!delegate) {
		return nil;
	}
	return delegate;
}

AppSetting *GetAppSetting() {
	AppDelegate *delegate = GetAppDelegate();
	if (!delegate) {
		return nil;
	}
	return delegate.setting;
}

AppCamera *GetAppCamera() {
	AppDelegate *delegate = GetAppDelegate();
	if (!delegate) {
		return nil;
	}
	return delegate.camera;
}

AppCameraLog *GetAppCameraLog() {
	AppDelegate *delegate = GetAppDelegate();
	if (!delegate) {
		return nil;
	}
	return delegate.cameraLog;
}

void AppBeginIgnoringInteractionEvents() {
	// 画面全体を透明なビューで覆って、イベントに反応しないようにします。
	UIWindow *window = GetAppDelegate().window;
	UIView *view = [[UIView alloc] initWithFrame:window.bounds];
	view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	view.tag = 0x12345678;
	[window addSubview:view];
}

void AppEndIgnoringInteractionEvents() {
	// 画面全体を覆っている透明なビューを取り除きます。
	UIWindow *window = GetAppDelegate().window;
	UIView *view = [window viewWithTag:0x12345678];
	[view removeFromSuperview];
}
