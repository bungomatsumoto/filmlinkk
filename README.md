
# Filmlinkk

## 概要
登録した映画製作者や興行主は配給会社を通さず、国境も超えてダイレクトに映画の上映権を交渉できます。完成前の作品や、まだ公開されていない作品でも、脚本などをアップロードすることで売り込むことが可能です。低予算映画は上映の機会が増え、地方の劇場も番組の選択肢が増えるはずです。

## コンセプト
映画の権利者（原権利者）と映画興行主をつなぐマッチングアプリ

## バージョン
Ruby 2.6.3 rails 5.2.3

## 機能一覧
- ログイン機能
- ユーザー登録機能
  - 原権利者と興行主に分類
  - Facebookアカウントでのログインが可能
- 作品登録機能
  - 原権利者のみが可能。上映権を持つ原権利者は上映を許可できる作品を任意の数だけ登録できます。完成前の作品や、まだ公開されていない作品でも、脚本などをアップロードすることで売り込むことが可能です
- 作品一覧表示機能
  - 作品情報を表示
  - キーワード検索、製作年検索が可能
- 作品詳細表示機能
- 作品編集機能
- 作品削除機能
  - 編集と削除は原権利者のみが可能
- 原権利者編集機能
  - 原権利者のみが可能
- 興行主一覧表示機能
  - キーワード検索が可能
- 興行主編集機能
  - 興行主のみが可能。興行主は劇場名など上映場所と地域を登録できます
- メッセージ送信機能
  - 原権利者と興行主の一対一のチャットルームで行う。興行主は登録された作品から気になる作品を選び、原権利者と直接メッセージのやり取りができ、上映料や上映期間等を交渉できます。原権利者から興行主にメッセージを送ることも可能です

## カタログ設計
https://docs.google.com/spreadsheets/d/1bU_3WPEMxcRiV94sb6cJihNxTidMcQESrLN_RdzyUfo/edit?usp=sharing

## ER図
https://docs.google.com/spreadsheets/d/1lppB0xRANGaI6Fa02ugMfOiJHyZKDMoKCtik2pwSgXc/edit?usp=sharing

## テーブル設計
https://docs.google.com/spreadsheets/d/1Jlbd8Tu0Fsccyz6u2ZVGsxhPwIgK04idApW03RzLt5c/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1lppB0xRANGaI6Fa02ugMfOiJHyZKDMoKCtik2pwSgXc/edit?usp=sharing

## ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1iFlUU3ihAxkJz7LnJfWUCaR7JwkUymnZMxdAJNkyOsM/edit?usp=sharing

## 使用予定gem
- devise
- ransack
- kaminari
- country_select
