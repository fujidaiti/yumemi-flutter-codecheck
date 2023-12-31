# 株式会社ゆめみ Flutter エンジニアコードチェック課題

このリポジトリは[株式会社ゆめみ Flutter エンジニアコードチェック課題](https://github.com/yumemi-inc/flutter-engineer-codecheck.git)に取り組んだ際の成果物です。



## 成果物

#### デプロイ先

https://fujidaiti.github.io/yumemi-flutter-codecheck/#/

#### デモ動画

<img src="contents/demo.mov" width="260"/>

## ダークモード

システムのテーマ（Dark/Light）に合わせてアプリのテーマも切り替わります。

<div align="center">
<img src="https://github.com/fujidaiti/yumemi-flutter-codecheck/assets/68946713/481bf951-5262-4e01-bec2-6bc12c592792" width="200"/>
<img src="https://github.com/fujidaiti/yumemi-flutter-codecheck/assets/68946713/9a30dae9-6789-4c2a-9775-7b93ce9dc808" width="200"/>
<img src="https://github.com/fujidaiti/yumemi-flutter-codecheck/assets/68946713/4e2bd515-a719-4827-92c6-bda55b801937" width="200"/>
</div>

## 実行

一部タスクの実行には[cargo_make](https://github.com/sagiegurari/cargo-make)を用いています。



以下のコマンドでデバッグモードのアプリを実行できます。自動生成ファイル(`*.freezed.dart`など)がgit管理されていないため、先に`build_runner`を実行しコード生成を行う必要があります（`makers`を利用する場合は明示的に実行する必要はありません）。

```shell
# cargo_makeを使う場合
makers run -d <device-id>

# もしくは
flutter pub run build_runner build --delete-conflicting-outputs && \
flutter pub run -d <device-id>
```

リリースモードで実行する場合は次のように`--release`を追加してください。

```shell
makers run -d <device-id> --release

# もしくは
flutter pub run build_runner build --delete-conflicting-outputs && \
flutter pub run -d <device-id> --release
```



### フェイクデータ

デフォルトでは本番データ（GitHub API）を用いますが、フェイクデータを利用することもできます。この場合、通信は発生しません。

```shell
# runではなくfun
makers fun -d <device-id>

# もしくは
flutter pub run build_runner build --delete-conflicting-outputs && \
flutter pub run -d <device-id> --dart-define DataType=fake
```

`--release`を付ければ先程と同様にリリースモードで実行できます。


## その他

静的解析やテスト等は`flutter`コマンドで行います。

```shell
# 静的解析
flutter analyze

# テスト（Mockitoによるコード生成が必要）
flutter pub run build_runner build --delete-conflicting-outputs && \
flutter test
```

## クレジット

GitHubのロゴは[Primer/Octvisuals](https://primer.style/design/foundations/icons/octovisuals)から取得しました。
