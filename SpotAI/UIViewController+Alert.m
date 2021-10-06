//
//  UIViewController+Alert.m
//  PlayOPC
//
//  Created by Hiroki Ishiura on 2015/04/05.
//  Copyright (c) 2015 Hiroki Ishiura. All rights reserved.
//
//  Released under the MIT license
//  http://opensource.org/licenses/mit-license.php
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)showAlertMessage:(NSString *)message title:(NSString *)title {
	[self showAlertMessage:message title:title handler:nil];
}

- (void)showAlertMessage:(NSString *)message title:(NSString *)title handler:(void (^)(UIAlertAction *action))handler {
	DEBUG_DETAIL_LOG(@"message=%@, title=%@", message, title);
	
	// メインスレッド以外から呼び出された場合は、メインスレッドに投げなおします。
	if (![NSThread isMainThread]) {
		__weak UIViewController *weakSelf = self;
		dispatch_async(dispatch_get_main_queue(), ^{
			DEBUG_LOG(@"weakSelf=%p", weakSelf);
			[weakSelf showAlertMessage:message title:title handler:handler];
		});
		return;
	}
	
	// 警告メッセージを表示します。
	NSString *alertTitle = title;
	NSString *alertMessage = message;
	NSString *alertActionTitle = NSLocalizedString(@"$title:OK", @"UIViewController.showAlertMessage");
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
	alertController.popoverPresentationController.sourceView = self.view;
	alertController.popoverPresentationController.sourceRect = self.view.bounds;
	alertController.popoverPresentationController.permittedArrowDirections = 0;
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:alertActionTitle style:UIAlertActionStyleDefault handler:handler];
	[alertController addAction:alertAction];
	[self presentViewController:alertController animated:YES completion:nil];
}

@end
