# flutter
flutter 项目

## 依赖库

```dart
dependencies:
flutter:
sdk: flutter
mobx: ^0.3.3+2
flutter_mobx: ^0.3.0+1


# The following adds the Cupertino Icons font to your application.
# Use with the CupertinoIcons class for iOS style icons.
cupertino_icons: ^0.1.2
flutter_svg: ">=0.12.4"
carousel_slider: ^1.3.0
fluro: "^1.4.0"
provider: ^2.0.1
dio: 2.1.0
photo_view: 0.4.2
json_annotation: ^2.0.0

dev_dependencies:
flutter_test:
sdk: flutter
build_runner: ^1.6.1
mobx_codegen: ^0.3.3+1
json_serializable: ^3.0.0
```

## `Flutter`版本

### `Ubuntu18`

```bash
Flutter 1.7.8+hotfix.3 • channel master • https://github.com/flutter/flutter.git
Framework • revision b76a1e8312 (11 days ago) • 2019-05-13 09:06:30 +0100
Engine • revision 816d3fc586
Tools • Dart 2.3.1 (build 2.3.1-dev.0.0 a0290f823c)
```

### `Windows10`

```bash
Flutter 1.7.8+hotfix.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b593f5167b (5 weeks ago) • 2019-04-22 07:51:33 -0700
Engine • revision ca31a7c57b
Tools • Dart 2.3.0 (build 2.3.0-dev.0.1 cf4444b803)
```

## `MacOS`

```bash
Flutter 1.7.8+hotfix.4 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2e540931f7 (3 days ago) • 2019-07-09 13:14:38 -0700
Engine • revision 54ad777fd2
Tools • Dart 2.4.0
```

## `Mobx`和`JSON`序列化构建

```dart
flutter packages pub run build_runner build
flutter packages pub run build_runner watch
flutter packages pub run build_runner watch --delete-conflicting-outputs
flutter packages pub run build_runner clean
```

## 运行

Run `flutter packages pub run build_runner build`构建`mobx`，成功以后启动`mobx`监听

Run `flutter packages pub run build_runner watch`，在你修改了`store`以后会自动刷新。

## `Mobx`踩坑


### 解决正式版发布不能联网问题

修改`android/app/src/main/AndroidManifest.xml`,新增以下权限

```bash
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.INTERNET"/>
```
