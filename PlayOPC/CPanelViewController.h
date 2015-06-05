//
//  CPanelViewController.h
//  PlayOPC
//
//  Created by Hiroki Ishiura on 2015/05/20.
//  Copyright (c) 2015 Hiroki Ishiura. All rights reserved.
//
//  Released under the MIT license
//  http://opensource.org/licenses/mit-license.php
//

#import <UIKit/UIKit.h>

/// カメラの撮影パラメータを変更します。
/// このビューコントローラーで操作できる撮影パラメータは、色味と画像エフェクトに関するものです。
@interface CPanelViewController : UITableViewController

/// ビューコントローラーが画面を表示して活動を開始する時に呼び出されます。
- (void)didStartActivity;
/// ビューコントローラーが画面を破棄して活動を完了する時に呼び出されます。
- (void)didFinishActivity;

@end
