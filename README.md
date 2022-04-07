# LearnCommunity

## サイト概要

- 学習マッチングアプリ
- 機能は随時追加更新していきます
- ３月１１日、講座購入の際に講座作成元にメール通知が届く機能を追加しました。
- ３月１８日、「お名前.com」とRoute53を使用してドメインの取得を行いました。
- ３月２９日、タグ付け機能と検索機能のバグを修正しました。
- ４月６日、EC2インスタンスを再作成しデプロイ　→　Route53でドメインを再取得　→　SSL証明書を取得しHTTPS通信を利用可能にする　→　Google認証を実装

## 今後の展望
- 今後は、googleのcalendar apiを導入して、タスク管理を実装します。
また、UI/UXの向上のために、web apiとしてrailsを使用して、フロントをreactにする予定です。そして、google spreadsheet api を導入して、学習ロードマップを作成可能とするかどうか検討中です。
- webRTCの導入を検討中

### サイトテーマ
- 学びたい人と教えたい人とのマッチングを行う
- 学びのためのコミュニティ形成と拡大
- 教えることによるビジネスチャンスの提供

### テーマを選んだ理由
- 現在は少年院に勤務しているが、矯正教育でも学校教育でも、社会の変化に対応するには柔軟性に欠ける部分が見受けられる
- 教える側も教わる側も最新の情報を自由に得るためにはそのシステムを構築する必要があると考えた
- 世代を問わずに学びたいことを学べるような環境やそれを就労へとつなぐことができるようなシステムの構築への関心

### ターゲットユーザ
- 自分のスキルで稼ぎたい・活用したい人
- 趣味や仕事や生活のために学びたい人

### 主な利用シーン
- オンライン・オフラインでの講座の集客
- 教材等を使用した自主学習
- コミュニティでの交流

## 設計書
### テーブル定義書
https://docs.google.com/spreadsheets/d/1CY7PtCUNArmCF8RdCtsjK4dsRwJJTxydyFswzWU0LJ4/edit#gid=1960613479
### ER図
https://app.diagrams.net/#G1HYTX6X3MFsg-mqYvUl2jDxipMxmN7nyU
### 詳細設計書
https://docs.google.com/spreadsheets/d/12DnjDBeTlLwlQ1Wg2f5YK5wqx4b1EoX6EnrvQbWLvl0/edit#gid=0

## 実装機能(随時追加更新していきます)
- [x] 管理者権限
- [x] ユーザー認証
- [x] CRUD処理
- [x] 講座作成
- [x] 講座注文
- [x] 講座検索
- [x] ユーザー間コミュニケーション機能
- [x] 講座注文時のメール通知機能
- [x] sns認証
- [ ] google calendar apiでスケジュール及びタスク管理を行う機能
- [ ] 機能は据え置きで、Ruby on Railsでweb apiを作成し、React.jsでapiを叩いて表示する。CSSフレームワークはChakra-UiかTailwindCSSを使用予定。
- [ ] 決済システム

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,Ruby,SQL,JavaScript
- サーバーサイドフレームワーク：Ruby on Rails
- CSSフレームワーク：Bootstrap
- JSライブラリ：jQuery
- 開発環境：Cloud9
- テスト:RSpec

## インフラ、その他
- AWS:EC2,RDS(MySQL),Route53,VPC
- webサーバー:NGINX
- アプリケーションサーバー:Puma

## 使用素材
- イラストAC　https://www.ac-illust.com/
