# Android版　撮影サンプルアプリケーション(ImageCaptureSample ) 構成

##クラス構成
以下の５つのクラスで構成されています。

|--|--|
| MainActivity        | アプリケーションのライフサイクルを管理する   |
| + LiveViewFragment    | ライブビュー画像を表示する画面を構成する     |
| ++ CameraLiveImageView | ライブビュー画像を描画するビューを提供する   |
| + RecViewFragment     | 撮影画像のプレビューを表示する画面を構成する |
| + SettingFragment     | 設定画面を構成する                           |

アプリケーションのライフサイクルを管理するMainActivityが

+ ライブビュー画像表示(LiveViewFragment)
+ 撮影画像表示(RecViewFragment)
+ 設定画面表示(SettingFragment)

の３つの表示画面を切り替える構成になっています。

## クラス図

## ライブビューを表示する流れ
+ `OLYCamera`クラスがカメラからライブビュー画像を受信すると、`OnLiveImageListener`インタフェースで定義された`onLiveImageUpdated`メソッドが呼び出され、ライブビュー画像が更新されます。
+ 同じタイミングで、`onLiveImageUserInteractionAreaUpdated`メソッドも呼び出され、ユーザーがオートフォーカスする座標を指定可能な領域の情報を更新します。
+ OnLiveImageListener

